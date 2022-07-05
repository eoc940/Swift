import UIKit

/*
 튜플은 2개이상의 연관된 데이터를 저장하는 복합 타입
 */

let twoNum: (Int, Int) = (1, 2)

let threeNum: (Int, Int, Int) = (1, 2, 3)
type(of: threeNum)

var threeValue = ("홍길동", 20, "서울")

threeValue = ("임꺽정", 35, "부산") // 같은 (String, Int, String) 타입으로는 넣을 수 있다

// 튜플의 각각의 데이터에 접근
threeValue.0
threeValue.1
threeValue.2


// Named Tuple : 코드 가독성이 좋아짐
let iOS = (language: "Swift", version: 5)

iOS.0
iOS.1
// 아래와 같이 쓰는게 좋다
iOS.language
iOS.version

// 튜플의 분해
let (first, second, third) = (1, 2, 3)
print(first)
print(second)
print(third)

// 튜플의 비교(거의 사용 안함)
(1, "zebra") < (2, "apple") // 1,2를 비교하고 결과가 나오므로 뒤의 문자열은 비교 x, 만약 숫자가 같다면 뒤의 문자열을 비교함
("blue", 1) < ("purple", -2)
// (1, true) < (2, false)  true와 false는 비교불가


// 스위프트의 switch문은 튜플 매칭을 지원 -> 코드를 단순한 형태로 표현 가능
switch iOS {
case ("Swift", 5):
    print("swift version 5")
case ("Swift", 4):
    print("swift version 4")
default:
    break
}

var coordinate = (9, 0)

switch coordinate {
case (let distance, 0), (0, let distance): // 뒤에 (0, ?)인 경우는 바인딩이 되지 않는다
    print(distance)
default:
    print("no")
}

coordinate = (1, -1)

switch coordinate {
case (let x, let y) where x == y:
    print("same")
case let (x, y) where x == -y:
    print("multiply -1")
case let (x, y):
    print("\(x)  \(y)")
}
