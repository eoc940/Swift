import UIKit

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct Calculator {
    var number: Int = 0
    mutating func plusNumber(_ num : Int) {
        number = number + num
    }
    
    mutating func reset() {
        self = Calculator() // 값 타입은 새로 생성해서 치환하는 것도 가능
    }
}

struct MyStruct {
    static let club = "iOS"
    
    static func doPrinting() {
        print("\(self.club)")
    }
    
    func doPrinting1() {
        print("\(MyStruct.club)")
    }
}

class SomeClass {
    static let name = "SomeClass"
}

let myClass: SomeClass.Type = SomeClass.self

SomeClass.name
SomeClass.self.name // 위와 같다

// 타입 가리키는 용도의 Self

extension Int {
    static let zero: Int = 0
    
    var zero: Self {
        return 0
    }
    
    static func toZero() -> Self {
        return Self.zero
    }
    
    func toZero() -> Self {
        return self.zero
    }
}

// 프로토콜에서 사용
extension BinaryInteger {
    func squared() -> Self { // 프로토콜 채택한 해당 타입
        return self * self
    }
}

protocol Remote {
    func turnOn() -> Self
}

extension String: Remote {
    func turnOn() -> String {//String을 Self로 바꿔도됌
        return ""
    }
}










