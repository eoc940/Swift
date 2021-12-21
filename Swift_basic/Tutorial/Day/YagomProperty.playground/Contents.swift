import UIKit

/*
 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다
 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있다
 연산 프로퍼티는 var로만 선언할 수 있다
 */

struct Student {
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var clas: String = "Swift"
    var koreanAge: Int = 0

    // 인스턴스 연산 프로퍼티
    var westernAge:Int {
        get {
            return koreanAge - 1
        }
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    // 읽기전용 인스턴스 연산 프로퍼티
    var selfIntroduction: String {
        get {
            return "저는 \(self.clas)반 \(name)입니다"
        }
    }
    
    // 읽기전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있다
    static var selfIntroduction: String {
        return "학생타입입니다"
    }
}

// MARK: 사용

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)

// 인스턴스 생성
var yagom: Student = Student()
yagom.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
yagom.name = "yagom"
print(yagom.name)

// 인스턴스 연산 프로퍼티 사용
print(yagom.selfIntroduction)

print(yagom.westernAge)

// MARK: 응용
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)

/*
 저장 프로퍼티와 연산 프로퍼티의 기능은
 함수, 메서드, 클로저, 타입 등의 외부에 위치한
 지역 / 전역 변수에도 모두 사용 가능하다
 */
var a: Int = 100
var b: Int = 200
var sum: Int {
    return a+b
}
print(sum)





