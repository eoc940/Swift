import UIKit

// 조건에 따라 선택지가 2개인 경우 삼항연산자 사용한다

let a = 3
var name = a > 0 ? "steve" : "tim cook"


// 삼항 연산자는 단독으로 쓰이기 보다는 값을 대입하는데 많이 사용됨


// 범위연산자

// 반폐쇄 범위연산자는 ..., ..< 뒤에 바로 숫자가 붙어야 한다
let b = ...10 // 10이하
let c = ..<10 // 10미만
let d = 1 ... 10
type(of: b)
type(of: c)
type(of: d)

let point = (1, 2)

switch point {
case (0, 0):
    print("0, 0")
case (-2...2, -2...2):
    print("between -2 and 2")
default:
    print(point.0, point.1)
}

// 패턴매칭 연산자 : 오른쪽 표현식이 왼쪽의 범위에 포함되는지에 따라 Bool값 리턴
var age = 20

1...9 ~= age
20...29 ~= age

let range = 1...10

range ~= -5
