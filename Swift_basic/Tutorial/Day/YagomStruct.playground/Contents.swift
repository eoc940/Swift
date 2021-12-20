import UIKit
import Darwin

// MARK: properties and methods
struct Sample {
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티 -> Sample이라는 타입에서 사용할 수 있는 타입 프로퍼티
    
    // instance method
    func instanceMethod() {
        print("intstance method")
    }
    
    // type method
    static func typeMethod() {
        print("type method")
    }
}

// MARK: 구조체 사용

// 가변 인스턴스
var mutable: Sample = Sample()

mutable.mutableProperty = 200
//mutable.immutableProperty = 200

// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 가변 프로퍼티라고 해도 값을 변경할 수 없음
//immutable.mutableProperty = 200
//immutable.immutableProperty = 200

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 타입 프로퍼티와 메서드는 인스턴스에서 참조 불가
// mutable.typeProperty = 400
// mutable.typeMethod()

struct Student {
    var name: String = "unknown"
    var clas: String = "Swift"
    
    static func selfIntroduce() {
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
yagom.selfIntroduce()

let jina: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//jina.name = "jina"
jina.selfIntroduce()
