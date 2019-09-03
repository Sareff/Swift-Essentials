import UIKit

//class Cat {
//    func purr() {
//    }
//}
//
//class Dog {
//    func bark() {
//    }
//    func test() -> (Cat)->()->() {
//        let barkFunction = Dog.bark
//        let purrFunction = Cat.purr
//        return purrFunction
//    }
//}
//
//class Dog {
//    func countAdder(_ f: @escaping () -> ()) -> () -> () {
//        var ct = 0
//        return {
//            ct += 1
//            print("count is \(ct)")
//            f()
//        }
//    }
//    func test() -> ()->() {
//        let f = {
//            return self.countAdder {
//                print("Hello")
//            }
//        }
//        return f()
//    }
//}
//
//let d = Dog()
//let result = d.countAdder {
//    print("hello")
//}
//result()
//result()
//result()
//d.test()()
//class Dog {
//    var whatThisDogSays = "woof"
//    func bark() {
//        print(self.whatThisDogSays)
//    }
//}
//
//func doThis(f: () -> ()) {
//    f()
//}
//
//doThis {
//    print("Hello")
//}
//let d = Dog()
//d.whatThisDogSays = "arf"
//let barkFunction = d.bark
//doThis(f: barkFunction)
//
//func changeName(of d: Dog, to newName: String) {
//    d.name = newName
//}
//
//let d = Dog()
//d.name = "Fido"
//print(d.name)
//changeName(of: d, to: "Rover")
//print(d.name)
//
//func removeCharacter(_ c: Character, from s: inout String) -> Int {
//    var howMany = 0
//    while let ix = s.firstIndex(of: c) {
//        s.remove(at: ix)
//        howMany += 1
//    }
//    return howMany
//}
//var s = "Hello"
//var result = removeCharacter("l", from: &s)
//print(result, s, separator: " | ")
//result = removeCharacter("e", from: s)
//result = removeCharacter("l", from: s)
//result = removeCharacter("l", from: s)
//result = removeCharacter("o", from: s)
//
