import UIKit

var num1 = 123 // global
var num2 = 456 // global

func swap(a: inout Int, b: inout Int) { // inout을 쓰면 let a 라고 선언되는 것이 아니라ㅍ &num1의 주소값이 전달됨)
    var tmp = a
    a = b
    b = tmp
}

// 함수 실행시 &를 붙여줘야 함
swap(a: &num1, b: &num2)

swap(a: &num1, b: &num2)

print(num1)
print(num2)







