import UIKit

/*
 타밉캐스팅
 
 스위프트의 타입캐스팅은
 인스턴스의 타입을 확인하는 용도
 또는 클래스의 인스턴스를
 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지
 확인하는 용도로 사용한다
 is, as를 사용한다
 */

// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

// MARK: 타입 확인
// is를 사용하여 타입을 확인한다
var result: Bool

result = yagom is Person
result = yagom is Student
result = yagom is UniversityStudent

result = hana is Person
result = hana is Student
result = hana is UniversityStudent

result = jason is Person
result = jason is Student
result = jason is UniversityStudent

/*
 MARK: 업 캐스팅
 as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록
 컴파일러에게 타입정보를 전환해준다
 Any 혹은 AnyObject로도 타입정보를 변환할 수 있다
 암시적으로 처리되므로 생략해도 무방하다
 */
var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
// var jina: UniversityStudent = Person() as UniversityStudent -> 컴파일 오류
var jina: Any = Person() // as Any 생략가능

/*
 MARK: 다운 캐스팅
 as? 또는 as!를 사용하여
 자식 클래스의 인스턴스로 사용할 수 있도록
 컴파일러에게 인스턴스의 타입정보를 전환해준다
 */

/*
 MARK: 조건부 다운 캐스팅
 as?
 */
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

/*
 MARK: 강제 다운 캐스팅
 as!
 */
var forcedCasted: Student

optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent -> 런타임 오류
//optionalCasted = jina as! UniversityStudent -> 런타임 오류
//optionalCasted = jina as! Student -> 런타임 오류

func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}
doSomething(someone: mike as Person)
doSomething(someone: mike)
doSomething(someone: jenny)
doSomething(someone: yagom)





