import UIKit

// struct는 값 타입인 반면 class는 참조타입
// MARK: property & method
class Sample {
    var mutableProperty: Int = 100
    let immutableProperty: Int = 100
    
    static var typeProperty: Int = 100
    
    func instanceMethod() {
        print("instance method")
    }
    // 타입 메서드 2가지
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}

// MARK: 클래스 사용
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
//mutableReference.immutableProperty = 200

let immutableReference: Sample = Sample()

// 불변 class의 경우도 가변 변수 변경 가능
immutableReference.mutableProperty = 200
//dsimmutableReference.immutableProperty = 200

// immutableReference = mutableReference

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

//mutableReference.typeProperty = 400

class Student {
    var name: String = "unknown"
    var clas: String = "Swift"

    class func selfIntroduce() {
        print("학생타입입니다")
    }
    
    func selfIntroduce() {
        print("저는 \(self.clas)반 \(name)입니다")
    }
}

Student.selfIntroduce() // 학생타입입니다

var yagom: Student = Student()
yagom.name = "yagom"
yagom.clas = "스위프트"
yagom.selfIntroduce() // 저는 스위프트반 yagom입니다

let jina: Student = Student()
// 불변 인스턴스 선언했음에도 불구하고 가변 프로퍼티 변경 가능하다
jina.name = "jina"
jina.selfIntroduce()



    
