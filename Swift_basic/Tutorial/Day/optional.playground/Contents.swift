import UIKit

// 옵셔널이란?
// 값이 있는지 없는지 모른다
var someVariable : Int? = nil

if someVariable == nil {
    someVariable = 90
}
// 옵셔널이라는 것으로 래핑되어있는 상태
print("someVariable : \(someVariable)")

// 언랩핑이란? 랩 즉 감싸져있는 것을 벗기는 것
// if let / guard let 두 가지 방법이 있다

if let otherVariable = someVariable {
    // someVariable에 값이 있으면 otherVariable에 넣어준다는 뜻
    // otherVariable은 언래핑이 되어 옵셔널이 아닌 값을 갖는다
    print("언래핑되었다. 즉 값이 있다. otherVariable : \(otherVariable)")
} else {
    // someVariable에 값이 없을 때이다
    print("값이 없다")
}

someVariable = nil

// someVariable 이 비어있으면 즉 값이 없으면 기본값으로 특정 값을 넣겠다
let myValue = someVariable ?? 10
print("myValue : \(myValue)")

var firstValue : Int? = 30
var secondValue : Int? = nil

print("firstValue : \(firstValue)")
print("secondValue : \(secondValue)")

unwrap(firstValue)
unwrap(secondValue)

func unwrap(_ parameter: Int?) {
    print("unwrap() called")
    // 값이 없으면 리턴해버린다
    // 즉 지나간다
    guard let unwrappedParam = parameter else {
        return
    }
    print("unwrappedParam : \(unwrappedParam)")
}
