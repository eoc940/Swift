import UIKit

// MARK: - 정의

/*
 enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의한다
 각 case는 소문자 카멜케이스로 정의한다
 각 case는 그 자체가 고유의 값이다
 */

// MARK: 열거형 사용
 
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue // day는 Weekday 타입이므로 축약해서 .으로 접근가능
print(day)

switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!!")
case .sat, .sun:
    print("신나는 주말!!!")
}

// MARK: - 원시값
/*
 C언어의 enum처럼 정수값을 가질 수도 있다
 rawValue를 사용하면 된다
 case별로 각각 다른 값을 가져야 한다
 */
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// 값이 들어있는 것들 중 최대값보다 1이 큰 값이 들어간다

/*
 rawValue를 통해 초기화할 수 있다
 rawValue가 case에 해당하지 않을 수 있으므로
 rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입이다
 */
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
}


enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")

print("School.university.rawValue == \(School.university.rawValue)")
// 값이 들어있지 않은 case는 변수명이 rawValue로 들어간다










