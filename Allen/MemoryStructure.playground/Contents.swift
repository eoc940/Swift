import UIKit

func addTwoNumbers(a: Int, b: Int) -> Int {
    var c = a + b
    return c
}

var n1 = 5
var n2 = 3

var n3 = addTwoNumbers(a: n1, b: n2)

print(n3)


// 메모리 예제

var total = 0

func square(_ i: Int) -> Int {
    return i * i
}

func squareOfSum(_ x: Int, _ y: Int) -> Int {
    var z = square(x + y)
    return z
}

func startFunction() {
    var a = 4
    var b = 8
    total = squareOfSum(a, b)
}

startFunction()


// 함수와 변수의 변화 예제

var a = 1
var b = 1

func addOneMore2() -> Int {
    b += 1
    return 5
}

func addOneMore() {
    var num = 0
    a += 1
    num += addOneMore2()
    print(num)
}

addOneMore()


