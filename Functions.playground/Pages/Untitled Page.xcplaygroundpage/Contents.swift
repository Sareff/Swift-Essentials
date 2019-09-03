import UIKit

class Cat {
    func purr() {
    }
}

class Dog {
    func bark() {
    }
    func test() -> (Cat)->()->() {
        //let barkFunction = Dog.bark
        let purrFunction = Cat.purr
        return purrFunction
    }
}

class Dogg {
    func countAdder(_ f: @escaping () -> ()) -> () -> () {
        var ct = 0
        return {
            ct += 1
            print("count is \(ct)")
            f()
        }
    }
    func test() -> ()->() {
        let f = {
            return self.countAdder {
                print("Hello")
            }
        }
        return f()
    }
}

let d = Dogg()
let result = d.countAdder {
    print("hello")
}
result()
result()
result()
d.test()()
class Dogie {
    var whatThisDogSays = "woof"
    func bark() {
        print(self.whatThisDogSays)
    }
}

func doThis(f: () -> ()) {
    f()
}

doThis {
    print("Hello")
}
let dd = Dogie()
dd.whatThisDogSays = "arf"
let barkFunction = dd.bark
doThis(f: barkFunction)

class Doge {
    var name: String = ""
}

func changeName(of d: Doge, to newName: String) {
    d.name = newName
}

let dog = Doge()
dog.name = "Fido"
print(dog.name)
changeName(of: dog, to: "Rover")
print(dog.name)

func removeCharacter(_ c: Character, from s: inout String) -> Int {
    var howMany = 0
    while let ix = s.firstIndex(of: c) {
        s.remove(at: ix)
        howMany += 1
    }
    return howMany
}
var s = "Hello"
var result1 = removeCharacter("l", from: &s)
print(result1, s, separator: " | ")
//result1 = removeCharacter("e", from: s)
//result1 = removeCharacter("l", from: s)
//result1 = removeCharacter("l", from: s)
//result1 = removeCharacter("o", from: s)

