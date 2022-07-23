import UIKit

enum School {
    case elimentary
    case middle
    case high
    case university
}

var school = School.university
var school2: School = .elimentary

// 원시값
enum Alignment: Int {
    case `left`
    case center = 3
    case `right`
}

Alignment.left.rawValue
Alignment.center.rawValue
Alignment.right.rawValue

Alignment(rawValue: 0)
Alignment(rawValue: 1)
Alignment(rawValue: 2)
Alignment(rawValue: 3)
Alignment(rawValue: 4)


enum Alignment1: String {
    case `left`
    case center = "C"
    case `right`
}

Alignment1.left.rawValue // String인 경우 그대로가 rawValue임
Alignment1.center.rawValue


enum RpsGame: Int {
    case rock
    case paper
    case scissors
}

RpsGame(rawValue: 0) // 옵셔널 타입

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let planet = Planet(rawValue: 2)!
let num = planet.rawValue
num


// 열거형의 연관값

enum Computer {
    case cpu(core: Int, ghz: Double)  // 추가적인 정보 저장 위해 사용
    case ram(Int, String)
    case hardDisk(gb: Int)
}

Computer.cpu(core: 4, ghz: 3.5)
Computer.ram(4, "samsung")

var chip = Computer.cpu(core: 8, ghz: 3.1)

switch chip {
case .cpu(core: 8, ghz: 3.1):
    print("8,3.1")
case .cpu(core: 8, ghz: 2.6):
    print("8,2.6")
default:
    print("관심 없음")
}

switch chip {
case .cpu(let a, let b):
    print("cpu \(a) core, \(b) ghz입니다")
default:
    print("관심 없음")
}

switch chip {
case let .cpu(a, b): // 위의 .cpu(let a, let b) 과 같다
    print("cpu \(a) core, \(b) ghz입니다")
default:
    print("관심 없음")
}

// 옵셔널

var number: Int? = 7

switch number {
case let .some(a):
    print(a)
case .none:
    print("nil")
}

// 열거형과 switch의 활용

enum LoginProvider: String {
    case email
    case facebook
    case google
}

let userLogin = LoginProvider.facebook

switch userLogin {
case .email:
    print("email login")
case .facebook:
    print("facebook login")
case .google:
    print("google login")
}

// 열거형에 (연관값이 없고), 옵셔널 열거형의 경우

enum SomeEnum {
    case left
    case right
}

// 타입을 다시 옵셔널 열거형으로 선언
let x: SomeEnum? = .left

switch x {
case .some(.left):
    print("left")
case .some(.right):
    print("right")
case .none:
    print("nil")
}

// 열거형에 연관값이 있는 경우

// if case는 switch에서 파생됨
if case Computer.cpu(core: let core1, ghz: let ghz1) = chip {
    print("\(core1), \(ghz1)")
}

let chipList: [Computer] = [
    .cpu(core: 4, ghz: 3.0),
    .cpu(core: 8, ghz: 5.0),
    .cpu(core: 2, ghz: 2.0),
    .ram(15, "SRAM"),
    .ram(30, "DRAM"),
    .hardDisk(gb: 500),
    .hardDisk(gb: 256),
    .hardDisk(gb: 128)
]

// 특정한 case만 뽑아서 가능 -> for if와 유사
for case let .cpu(core: c, ghz: h) in chipList {
    print("\(c) \(h)")
}

// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우
let arrays: [Int?] = [nil, 2, 3, nil, 5]

for case .some(let number) in arrays {
    print("\(number)")
}

// 옵셔널 패턴
let a: Int? = 1

switch a {
case let z?: // .some 을 간소화한 문법
    print(z)
case nil:
    print("nil")
}


// unknown

let userLogin2 = LoginProvider.email

switch userLogin2 {
case .email:
    print("email")
case .facebook:
    print("facebook")
case .google:
    print("google")
@unknown default: // unknown을 붙이면 switch에서 모든 경우를 다루도록 노란 경고메시지를 준다. 에러가 나지는 않지만 논리적 문제가 생기는 것을 방지하는 역할을 한다
    print("other")
}























