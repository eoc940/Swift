import UIKit

enum SomeError: Error {
    case aError
}

func throwingFunc() throws {
    throw SomeError.aError
}

do {
    try throwingFunc()
} catch {
    print(error)
}

func handleError() throws {
    try throwingFunc()
}

do {
    try handleError()
} catch {
    print(error)
}

//  에러를 던지는 throwing 함수를 파라미터로 받는 경우, 내부에서 다시 에러를 던지기 가능
//  rethrow키워드 필요
func someFunction1(callback: () throws -> Void) rethrows {
    try callback()
}

func someFunction2(callback: () throws -> Void) rethrows {
    enum ChangedError: Error {
        case cError
    }
    
    do {
        try callback()
    } catch {
        throw ChangedError.cError
    }
}

// 에러는 메서드나 생성자에도 적용 가능
enum NameError: Error {
    case noName
}

class Course {
    var name: String
    
    init(name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("수업 올바르게 생성")
        }
    }
}
do {
    var course = try Course(name: "스위프트클래스")
    print(course.name)
} catch NameError.noName{
    print("객체 생성되지 않음")
}

do {
    let a = try Course(name: "스위프트5")
} catch NameError.noName {
    print("이름이 없어 수업 생성 실패")
}

// 에러 던지는 메서드/생성자 재정의할때 반드시 에러 던지는 것으로 재정의해야함
class NewCourse: Course {
    override init(name: String) throws {
        try super.init(name: name)
    }
}

// defer문은 코드의 실행을 스코프가 종료되는 시점으로 연기시키는 문법
func deferStatement() {
    defer {
        print("나중에 실행")
    }
    
    print("먼저 실행")
}

deferStatement()

func deferStatement2() {
    if true {
        print("먼저 실행하기")
        return
    }
    
    defer {
        print("나중에 실행하기") // 실행 안됨
    }
}

deferStatement2()

func deferStatement3() {
    defer {
        print("나중에 실행하기")
    }
    if true {
        print("먼저 실행하기")
        return
    }
}

deferStatement3()

func deferStatement4() {
    defer {
        print(1) // 가장 마지막으로 등록됨
    }
    defer {
        print(2)
    }
    defer {
        print(3)
    }
}

deferStatement4()







