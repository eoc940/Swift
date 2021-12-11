import UIKit
import Foundation
import CoreFoundation

// enum은 데이터를 담는 그릇이라고 생각하면 된다
// 학교 - 초, 중, 고
enum School {
//    case elementary
//    case middle
//    case high
    case elementary, middle, high
}

// 위 enum은 케이스만 나눈 것이다

let yourSchool = School.high
print("yourSchool : \(yourSchool)")
print("yourSchool :", yourSchool)


// 이번에는 케이스에 값도 넣어보겠다
enum Grade : Int {
    case first = 1
    case second = 2
}

let yourGrade = Grade.second

// 값에 접근할때는 케이스가 담긴 변수에 rawValue를 참조하면 된다
print("yourGrade : \(yourGrade.rawValue)")
print("yourGrade :", yourGrade.rawValue)


// 아래와 같이 value의 타입을 지정할 수 있다
// enum도 함수를 가질 수 있다
enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
    
    /*
     함수명 -> 타입 : 함수의 리턴타입이 타입이라는 것이다
     switch self는 즉 SchoolDetail 자기자신이 case와 일치할때
     name을 리턴하게 된다
     */
    func getName() -> String {
        switch self {
        case .elementary(let name) :
            return name
        case let .middle(name) :
            return name
        case .high(let name) :
            return name
        }
    }
}

let yourMiddleSchoolName = SchoolDetail.middle(name: "정대리중학교")
print("yourMiddleSchoolName : \(yourMiddleSchoolName.getName())")
