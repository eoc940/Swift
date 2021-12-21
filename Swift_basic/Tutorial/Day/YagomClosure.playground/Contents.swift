import UIKit

/*
 코드의 블럭
 일급 시민(first-citizen)
 변수, 상수 등으로 저장, 전달인자로 전달이 가능
 함수 : 이름이 있는 클로저
 */

// 함수를 사용한다면
func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}
var sumResult: Int = sumFunction(a: 1, b: 2)

// 클로저를 사용한다면
var sum: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
}
sumResult = sum(1, 2)
print(sumResult)

// 함수는 클로저의 일종이므로
// sum 변수에는 당연히 함수도 할당할 수 있다
sum = sumFunction(a:b:)
sumResult = sum(1, 2)
print(sumResult)

// 클로저는 함수의 전달인자로서 많이 사용됨

let add: (Int, Int) -> Int
add = { (a:Int, b:Int) -> Int in
    return a+b
}

let subtract: (Int, Int) -> Int
subtract = {(a:Int, b:Int) -> Int in
    return a-b
}

let divide: (Int, Int) -> Int
divide = {(a:Int, b:Int) -> Int in
    return a/b
}

func calculate(a:Int, b:Int, method: (Int, Int) -> Int) -> Int {
    return method(a,b)
}
var calculated : Int
calculated = calculate(a: 50, b: 10, method: add)
calculated = calculate(a: 50, b: 10, method: subtract)
calculated = calculate(a: 50, b: 10, method: divide)
calculated = calculate(a: 50, b: 10, method: { (left: Int, right:Int) -> Int in
    return left * right
})






 
