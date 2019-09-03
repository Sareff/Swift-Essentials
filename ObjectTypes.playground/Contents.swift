import UIKit

// I am an Evil Genious >:DDD
extension Int {
    public subscript(ix: Int) -> Int {
        get {
            let s = String(self)
            return Int(String(s[s.index(s.startIndex, offsetBy: ix)]))!
        }
    }
}

let i = 123
i[0] // HAHHAHAHHAHHAHAHHAAHAHHAAHAH

struct Some {
    var name: String
    var age: Int
    var id: Int
    init(name: String, age: Int, id: Int) {
        self.name = name
        self.age = age
        self.id = id
    }
    subscript(boun: Int) -> String {
        get {
            if boun == 1 { return self.name }
            else if boun == 2 { return String(self.age) }
            else if boun == 3 { return String(self.id)  }
            else { fatalError("NO") }
        }
    }
}
let some = Some(name: "Josh", age: 12, id: 123)
some[2]
class Dong {
    func bark() {
        print("woof")
    }
}

class AngryDong : Dong {
    override func bark() {
        print("WOOF WOOF WOOF")
    }
    func kill() {
        print("aghfdjfahjdsf")
    }
}

let ad1 = AngryDong()
let d1 = ad1 as Dong
ad1.bark()
ad1.kill()
d1.bark()

//Umbrella types

class Dogie {
    @objc static var whatADogSays : String = "woof"
}
class Catt {}

let cock: AnyClass = Catt.self
let sr = cock.whatADogSays

class Sobaka {
    @objc var noise: String = "woof"
    @objc func bark() -> String {
        return "woof"
    }
}
class Koska {}

let kot: AnyObject = Koska()
let stroka = kot.noise
let fun = kot.bark?()

class Thing {
    @objc let variable: Any
    @objc init(variable: Any) {
        self.variable = variable
    }
}

let t = Thing(variable: "123")
type(of: t.variable)
let strin: AnyObject = "123" as NSString
type(of: strin)
//Extensions

extension Array where Element: Comparable {
    func myMin() -> Element? {
        var minimum = self.first
        for item in self.dropFirst() {
            if item < minimum! {
                minimum = item
            }
        }
        return minimum
    }
}

let array = [1, 2, 3, 4]
let minimum = array.myMin()

extension String { // Interesting thing over there
    func range(_ start: Int, _ count: Int) -> Range<String.Index> {
        let i = self.index(start >= 0 ? self.startIndex : self.endIndex, offsetBy: start)
        print(self[i])
        let j = self.index(i, offsetBy: count)
        print(self[j])
        return i..<j
    }
}

let str = "abcdefg"
let r1 = str.range(2,2)
let r2 = str.range(-3,2)
print(str[r1], str[r2])

//Generics

//Mini-abstract game (without any gameplay as well)

protocol Wieldable {
}
struct Sword: Wieldable {
}
struct Bow: Wieldable {
}

protocol Fighter {
    associatedtype Enemy: Fighter
    associatedtype Weapon: Wieldable
    func steal(weapon:Self.Enemy.Weapon, from:Self.Enemy)
}

struct Solider: Fighter {
    typealias Weapon = Sword
    typealias Enemy = Archer
    func steal(weapon: Bow, from: Archer) {
    }
}
struct Archer: Fighter {
    typealias Weapon = Bow
    typealias Enemy = Solider
    func steal(weapon: Sword, from: Solider) {
    }
}

struct Camp<T:Fighter> {
    var spy : T.Enemy?
}

var c = Camp<Solider>()
c.spy = Archer()
c.spy
//c.spy = Solider() - won't compile.
//End.

protocol Meower {
    func meow()
}
struct Wrapper<T:Meower> {
    var meower: T
}
class Cat : Meower {
    func meow() {
        print("meow")
    }
}
class CalicoCat : Cat {
}

let w: Wrapper<Cat> = Wrapper(meower: CalicoCat())


protocol Flier {
    init()
}
struct Bird : Flier {
    init() {}
}
struct FlierMaker<T:Flier> {
    static func makeFlier() -> T {
        return T()
    }
}

let f = FlierMaker<Bird>.makeFlier()

class SacredDawg {
    var name: String
    required init(name: String) {
        self.name = name
    }
}

class Dawg1: SacredDawg {
    required init(name: String) {
        super.init(name: name)
    }
    class func dogMakerAndNamer(_ whatType: Dawg1.Type) -> Dawg1 {
        let d = whatType.init(name: "Fido")
        return d
    }
}

class Dawg1ThePrayer: Dawg1 {
    required init(name: String) {
        super.init(name: name)
    }
}

class Dawg2: SacredDawg {
    required init(name: String) {
        super.init(name: name)
    }
    class func dogMakerAndNamer<WhatType:Dawg2>(_:WhatType.Type) -> WhatType {
        let d = WhatType.init(name: "Fido")
        return d
    }
}

class Dawg2ThePrayer: Dawg2 {
    required init(name: String) {
        super.init(name: name)
    }
}

let dawg1 = Dawg1.dogMakerAndNamer(Dawg1.self)
dawg1.name
let dawg1ThePiligrim = Dawg1ThePrayer.dogMakerAndNamer(Dawg1ThePrayer.self) // I cathed this issue, finally!
dawg1ThePiligrim.name
let dawg2 = Dawg2.dogMakerAndNamer(Dawg2.self)
dawg2.name
let dawg2ThePiligrim = Dawg2ThePrayer.dogMakerAndNamer(Dawg2ThePrayer.self)
dawg2ThePiligrim.name
//Protocols

struct Nest : ExpressibleByIntegerLiteral {
    var eggCount : Int = 0
    init() {}
    init(integerLiteral val: Int) {
        self.eggCount = val
    }
}

func reportEggs(_ nest: Nest) {
    print("This nest contains \(nest.eggCount) eggs.")
}
let n : Nest = 2
n.eggCount
reportEggs(0)

@objc protocol Flier2 {
    @objc optional var song : String { get }
    @objc optional func sing() -> String
}

class Bird2 : Flier2 {
    func sing() -> String {
        return "tweet"
    }
}

let f1 : Flier2 = Bird2()
let s1 = f1.song
type(of: s1)
let s2 = f1.sing?()
type(of: s2)

enum Filter : String, CustomStringConvertible {
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
    var description : String { return self.rawValue }
}

let typee = Filter.albums
print("It's \(typee)")
print(typee)
let s = String(describing: typee)




protocol Flier1 {
    func fly()
}

struct Bird1 : Flier1 {
    func fly() {
    }
    func getWorm() {
        print("Got a worm")
    }
}

func isBird(_ f: Flier1) -> Bool {
    return f is Bird1
}

func tellGetWorm(_ f: Flier1) {
    (f as? Bird1)?.getWorm()
}

let bird = Bird1()
isBird(bird)
tellGetWorm(bird)

//Classes

class Dog {
    var name : String
    required init(name: String) {
        self.name = name
    }
    class func makeAndName() -> Self {
        let d = self.init(name: "Fido")
        return d
    }
    func havePuppy(name: String) -> Self { //If there was a "Dog" instead of "Self", then nd2 would be Dog typed
        return type(of: self).init(name: name)
    }
}
class NoisyDog : Dog {
    
}

let d = Dog(name: "Fido")
let d2 = d.havePuppy(name: "Fido Junior")
let nd = NoisyDog(name: "Rover")
let nd2 = nd.havePuppy(name: "Rover Junior")

class Doggie {
    class var whatDogSay : String {
        return "woof"
    }
    func bark() {
        print(type(of: self).whatDogSay) // Important feature to support inheritance! Just "self." doesn't work.
    }
}

class NoisyDoggie : Doggie {
    override class var whatDogSay : String {
        return "woof woof woof"
    }
}

let doggie = Doggie()
doggie.bark()
let noisyDoggie = NoisyDoggie()
noisyDoggie.bark()

class Dog2 {
    func bark() {
        print("woof", terminator: " ")
    }
}

class NoisyDog2 : Dog2 {
    override func bark() {
        super.bark(); super.bark()
    }
    func beQuiet() {
        self.bark()
    }
}

func tellHush(_ d: Dog2) {
    //(d as! NoisyDog).beQuiet() - first example
    
    //let d2 = d as! NoisyDog - second example
    //d2.beQuiet()
    
    (d as? NoisyDog2)?.beQuiet()
}

let nd3 = NoisyDog2()
tellHush(nd3)
let d3 = Dog2()
tellHush(d3)

class Dogge {
    var name : String
    var license : Int
    init(name: String, license: Int) {
        self.name = name
        self.license = license
    }
    convenience init(license: Int) {
        self.init(name: "Fido", license: license)
    }
    convenience init() {
        self.init(license:1)
    }
}

let doggie2 = Dogge()

class Dogg {
    var name : String = "Fido"
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

let dog = Dogg(name: "Rover")
let dog2 = Dogg()

final class Doggg {
    var name: String
    var age: Int
    var license: Int
    init(name: String, age: Int, license: Int) {
        self.name = name
        self.age = age
        self.license = license
    }
    func changeName(name: String) {
        self.name = name
    }
}

let fido = Doggg(name: "Fido", age: 1, license: 1234)
let rover = fido
func changeDog(_ d:Doggg) {
    d.name = "Rover"
}
changeDog(rover)
print(rover.name, fido.name)

//Sructs

struct Digit {
//    var number : Int
//    init(_ number: Int) {
//        self.number = number
//    }
    var number : Int = 10 // let/var; What ever you like.
    mutating func changeNum(_ n: Int) {
        self.number = n
    }
}

var dd = Digit()
let dd2 = Digit(number: 42)
dd.number
dd2.number
dd.changeNum(2)
dd.number

var dd3 : Digit = Digit(number: 123) {
    didSet {
        print("d3 was set")
    }
}
dd3.number = 42

//Enums

enum Node {
    case node(Int)
    indirect case left(Int, Node)
    indirect case right(Int, Node)
    indirect case both(Int, Node, Node)
}

let layer1 = Node.node(1)
let layer2 = Node.both(2, layer1, layer1)
let layer3 = Node.left(3, layer2)

enum MyError {
    case number(Int)
    case message(String)
    case fatal
}

let err : MyError = .number(4)

enum Filter2 : String, CaseIterable {
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
    init?(_ ix: Int) {
        if !Filter2.allCases.indices.contains(ix) {
            return nil
        }
        self = Filter2.allCases[ix]
    }
    init?(_ rawValue: String) {
        self.init(rawValue: rawValue)
    }
    mutating func advance() {
        var ix = Filter2.allCases.firstIndex(of: self)!
        ix = (ix + 1) % Filter2.allCases.count
        self = Filter2.allCases[ix]
    }
}

let filter1 : Filter2 = .albums
var filter2 = Filter2.playlists
filter2.advance()
let filter3 = Filter2(rawValue: "Podcasts")!
let filter4 = Filter2(3)
let filter5 = Filter2("Albums")!
let filter6 = Filter2(rawValue: "New one")
let filter7 = Filter2(4)

//Object types and its features

struct Digit0 {
    var number : Int
    init(_ n: Int) {
        self.number = n
    }
    subscript(ix: Int) -> Int {
        get {
            let s = String(self.number)
            return Int(String(s[s.index(s.startIndex, offsetBy: ix)]))!
        }
        set {
            var s = String(self.number)
            let i = s.index(s.startIndex, offsetBy: ix)
            s.replaceSubrange(i...i, with: String(newValue))
            self.number = Int(s)!
        }
    }
}

var dig = Digit0(1234)
let key = dig[1]
dig[0] = 2
print(d)

class MyClass {
    var s = ""
    func store(_ s:String) {
        self.s = s
    }
}

let m = MyClass()
let ff = MyClass.store(m)

ff("howdy")
print(m.s)


struct Greeteng {
    static let friendly = "hello there"
    static let hostile = "go away"
    static let ambivalent = Greeteng.friendly + " but " + Greeteng.hostile
    static func beFriendly() {
        print(self.friendly)
    }
}

class Doge {
    let name : String
    let license : Int
    let whatDogSay = "woof"
    init(name: String, license: Int) {
        self.name = name
        self.license = license
    }
    func bark() {
        print(self.whatDogSay)
    }
    func speak() {
        self.bark()
        print("I'm \(self.name)")
    }
}

class Moi {
    let first = "Ilya"
    let second = "Bezridniy"
    lazy var whole = self.first + " " + self.second
    var whole2 : String {
        return self.first + " " + self.second
    }
}

let fido2 = Doge(name: "Fido", license: 1234)
let spot2 = Doge(name: "Spot", license: 1379)
fido2.speak()

Greeteng.beFriendly()
