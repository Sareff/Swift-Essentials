import UIKit

//var menu = ["pizza": 10.99, "ice cream": 4.99, "salad": 7.99]
//print("The total cost of my meal is \(menu["pizza"]! + menu["salad"]!)")

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

let numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
hasAnyMatches(list: numbers, condition: {
    return $0 < 10
})
//---------------------
//1
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
//2
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
//---------------------

let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)


// Classes

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//Experiment
class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)."
    }
}

let test2 = Circle(radius: 5.0, name: "my test circle")
test2.area()
test2.simpleDescription()

extension Int {
    func sayHello() {
        print("Hello, I'm \(self)")
    }
}

1.sayHello()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimetr: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle woth sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimetr)
print(triangle.sideLength)
triangle.perimetr = 9.0
print(triangle.perimetr)
print(triangle.sideLength)
triangle.sideLength = 2
print(triangle.perimetr)
print(triangle.sideLength)

