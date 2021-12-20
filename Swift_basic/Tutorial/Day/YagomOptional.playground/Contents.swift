import UIKit

/*
 옵셔널은 값이 있을 수도 있고 없을 수도 있음
 nil의 가능성을 명식적으로 표현해준다
 */

// !는 암시적 추출 옵셔널
var optionalValue: Int! = 100
switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}
// 기존 변수처럼 사용 가능
optionalValue = optionalValue + 1
// nil 할당 가능
optionalValue = nil
// 잘못된 접근으로 인한 런타임 오류 발생(nil에 접근하기 때문)
// optionalValue = optionalValue + 1


// ?는 일반적 옵셔널 - 옵셔널 타입임
var optionalValue1: Int? = 100
switch optionalValue1 {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}
// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue1 = optionalValue1 + 1

// nil 할당 가능
optionalValue1 = nil


/*
 Optional Unwrapping
 옵셔널 꺼내기 - 옵셔널 바인딩, 강제 추출
 */

// Optional 바인딩 - nil체크, 안전한 값 추출
// 옵셔널은 ? ! 둘다 값을 보호하고 있는 상자라고 생각해보자
// 우리가 상자에 값이 있는지 물어보고 값이 있으면 꺼내오고 없으면 지나침
func printName(_ name:String) {
    print(name)
}

// 전달되는 값의 타입이 다르기 때문에 컴파일 오류발생
//var myName: String? = nil
//printName(myName)

// if let을 통해 바인딩 할 수 있다
var myName: String! = nil
if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}

// ,을 사용해서 여러 변수 옵셔널 바인딩
var myNamed: String? = "yagom"
var yourName: String? = nil
if let name = myNamed, let friend = yourName {
    print("\(name) and \(friend)")
} else {
    print("둘 중에 하나 이상 nil이다")
}

yourName = "hana"

if let name = myNamed, let friend = yourName {
    print("\(name) and \(friend)")
} // yagom and hana

// 강제 추출 방식
var myName2: String? = "yagom"
printName(myName2!) // 옵셔널을 달아 강제로 값을 꺼냄 -> yagom

myName2 = nil
//print(myName2!) // 강제추출시 값이 없으므로 런타임 오류 발생

var yourName2: String! = nil
//printName(yourName2) // nil값이 전달되기 때문에 런타임 오류발생



