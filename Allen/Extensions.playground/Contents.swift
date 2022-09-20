import UIKit
import Darwin

enum SomeType { // struct, class 도 물론 extension 가능
    case a
    case b
}

extension SomeType {
    func doSomething() {
        print("do something")
    }
}

class Person {
    var id = 0
    var name = "name"
    var email = "abc@gmail.com"
    
    func walk() {
        print("person walk")
    }
}

class Student: Person {
    var studentId = 1
    
    override func walk() {
        print("student walk")
    }
    func study() {
        print("student study")
    }
}

class Undergraduate: Student {
    var major = "major"
    
    override func walk() {
        print("under walk")
    }
    override func study() {
        print("under study")
    }
    func party() {
        print("under party")
    }
    
    // extension에 있는건 재정의 불가, 그러나 @objc 붙이면 재정의 가능하긴 함(objective-c의 구현방식대로 바꿔주는 것)
//    override func play() {
//        print("undergraduate play")
//    }
}

extension Student {
    func play() {
        print("student play")
    }
}

var under = Undergraduate()
under.play()

// 확장의 장점
extension Int {
    var squared: Int {
        return self * self
    }
}

5.squared
3.squared

// 타입 계산 속성의 확장
extension Double {
    static var zero: Double {
        return 0.0
    }
}

Double.zero

extension Int {
    mutating func square() {
        self = self * self
    }
}

// 생성자 확장
var color = UIColor(red: 0.3, green: 0.5, blue: 0.4, alpha: 1)

extension UIColor {
    convenience init(color: CGFloat) {
        self.init(red: color/255, green: color/255, blue: color/255, alpha: 1)
    }
}

UIColor.init(color: 1)

struct Point {
    var x = 0.0, y = 0.0
    
    init() {
        self.init(x: 0.0, y: 0.0)
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

// 서브스크립트 확장
extension Int {
    subscript(num: Int) -> Int {
        var decimalBase = 1
        
        for _ in 0..<num {
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
    }
}

123456789[0]
123456789[1]
123456789[2]
123456789[8]

// 중첩 타입
class Day {
    enum Weekday {
        case mon
        case tue
        case wed
    }
    
    var day: Weekday = .mon
}
var ddd: Day.Weekday = .mon

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self  {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])



