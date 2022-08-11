import UIKit

class Dog {
    static let species: String = "Dog"
    
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
}

let dog = Dog(name: "choco", weight: 15.0)
dog.name
dog.weight

Dog.species

class Circle {
    
    // (저장) 타입 속성 = 값이 항상 있어야 함
    static let pi: Double = 3.14
    static var count: Int = 0
    
    // 저장 속성
    var radius: Double
    
    // 계산 속성
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

var circle1 = Circle(radius: 2)
Circle.count


var circle2 = Circle(radius: 3)
Circle.count

let a = Circle.pi

Double.pi
Int.max
Int.min

// 계산 타입 속성

class Circle1 {
    
    // (저장) 타입 속성 = 값이 항상 있어야 함
    static let pi: Double = 3.14
    static var count: Int = 0
    
    // (계산) 타입 속성(read-only)
    static var multiPi: Double {
        return pi * 2
    }
    
    // 저장 속성
    var radius: Double
    
    // 계산 속성
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func getArea() -> Double {
        let area = Circle.pi * radius * radius
        return area
    }
}

let b = Circle1.multiPi

let c1 = Circle1(radius: 3)
c1.getArea()
