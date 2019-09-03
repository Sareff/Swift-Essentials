import UIKit

//@discardableResult
func sum(_ x: Int, _ y: Int) -> Int {
    let result = x + y
    return result
}

print(sum(15,15))
sum(1,2)

//import Swift
//
//class Manny {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func sayName() {
//        print(name)
//    }
//
//    class Klass : Manny {
//        override init(name: String) {
//            super.init(name: name)
//        }
//    }
//}
//
//let human1 = Manny(name: "manny")
//human1.sayName()
//
//let human2 = Manny.Klass(name: "klass")
//human2.sayName()

//class Dog {
//    var name = ""
//    private var whatADogSays = "Woof"
//    func bark() {
//        print(self.whatADogSays)
//    }
//    func speak() {
//        print("My name is \(self.name)")
//    }
//}
//
//let fido = Dog()
//fido.name = "Fido"
//fido.bark()
//fido.speak()

