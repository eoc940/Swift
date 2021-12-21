import UIKit

/*
 상속
 
 스위프트의 상속은 클래스, 프로토콜 등에서 가능하다
 열거형, 구조체는 상속이 불가능하다
 스위프트는 다중상속을 지원하지 않는다
 이번 파트에서는 클래스의 상속에 대해서 알아보자
 */
class Person {
    var name: String = ""
    
    func selfIntroduce() {
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용하여 재정의를 방지할 수 있다
    final func sayHello() {
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    
    /*
     재정의 가능한 class 메서드라도
     final 키워드를 사용하면 재정의 할 수 없다
     메서드 앞의 static과 final class는 똑같은 역할을 한다
     */
    final class func finalClassMethod() {
        print("type method - final class")
    }
}

class Student : Person {
    // name 프로퍼티는 상속이 되어있음
    var major : String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classMethod() {
        print("overriden type method - class")
    }
}
let yagom: Person = Person()
let hana: Student = Student()

yagom.name = "yagom"
hana.name = "hana"
hana.major = "Swift"

yagom.selfIntroduce()

hana.selfIntroduce()

hana.sayHello()

Student.classMethod()
Student.typeMethod()
Person.classMethod()










