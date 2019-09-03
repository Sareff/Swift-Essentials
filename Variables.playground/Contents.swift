import UIKit
//Optionals

let sr : String? = "123"
let i = sr.map {Int($0)}
type(of: i)
print(i!!)
let sf : String? = "howdy"
let sf2 = sf.map {$0.uppercased()}
let sf3 = sf2.flatMap {$0.lowercased()}
print(sf2!)
print(sf3)



class Dog {
    var noise: String?
    func speak() -> String? {
        return self.noise
    }
}
let d = Dog()
let bigname = d.speak()?.uppercased()

var string = Optional("howdy")
type(of: string)

//Strings

var strin = "hello"
let ix = strin.startIndex
let r = strin.index(ix, offsetBy: 1)...strin.index(ix, offsetBy: 3)
strin.replaceSubrange(r, with: "ipp")
strin.removeSubrange(r)
print(strin)

var arr = Array("hello")
var gh = ""
arr.map { gh.append($0) }
print(gh)
type(of: gh)
var gt = String(arr)
print(gt)
type(of: gt)

var stri = "hello"
let ixx = stri.index(stri.startIndex, offsetBy:1)
stri.insert(contentsOf: "ey, h", at: ixx)


let strr = "\u{BF}Qui\u{E9}n?"
print(strr)
for i in strr.utf8 {
    print(i, terminator:" ")
}
print()
for i in strr.utf16 {
    print(i, terminator:" ")
}
print("\n\n")

func flag(country: String) -> String {
    let base : UInt32 = 127397
    var s = ""
    for v in country.unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return String(s)
}

let str = flag(country: "")
print(str)

//Ints

let int = Int.max - 2
let (j, over) = int.addingReportingOverflow(12/2)
let k = int &+ 12/2
print(j, over)
print(k)

let regularInteger = 3005

let num = 3

var storage: Int = 10 {
    willSet {
        print("fuck you, no way I'll change")
    }
    didSet {
        print("I'm still here")
        storage = oldValue
    }
}

storage = 11
print(storage)

var somenum: Int = 42 {
    willSet {
        print("Setting variable to \(newValue)...")
    }
    didSet {
        print("The old values is \(oldValue)")
    }
}

somenum = 1337

var number1: Double = 2

var cube: Double {
    get {
        return 3.0 * number1
    }
    set {
        number1 = newValue / 3.0
    }
}

number1 = 4
print(cube)

cube = 6.0
print(number1)
