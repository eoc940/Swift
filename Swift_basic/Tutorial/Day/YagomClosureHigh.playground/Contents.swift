import UIKit
import os

/*
 클로저 고급
 
 후행 클로저
 반환타입 생략
 단축 인자이름
 암시적 반환 표현
 */

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a,b)
}

var result: Int

// MARK: 후행 클로저
/*
 클로저가 함수의 마지막 전달인자라면
 마지막 매개변수 이름을 생략한 후
 함수 소괄호 외부에 클로저를 구현할 수 있다
 */
result = calculate(a: 10, b: 10) {(left:Int, right:Int) -> Int in
    return left + right
}
print(result)

// MARK: 반환타입 생략
/*
 calculate 함수의 method 매개변수는
 Int 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문에
 굳이 클로저에서 반환타입을 명시해 주지 않아도 된다
 대신 in키워드는 생략할 수 없다
 */
result = calculate(a: 10, b: 10, method: {
    (left:Int, right:Int) in
    return left + right
})

print(result)

// 후행클로저와 함께 사용도 가능
result = calculate(a: 10, b: 10) {(left:Int, right:Int) in
    return left + right
}

// MARK: 단축 인자이름
/*
 클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있다
 단축 인자이름은 클로저의 매개변수의 순서대로 $0, $1 처럼 표현한다
 */
result = calculate(a: 10, b: 10, method: {
    return $0 + $1
})
print(result)

// 당연히 후행 클로저와 함께 사용할 수 있다
result = calculate(a: 10, b: 10) {
    return $0 + $1
}
print(result)

// MARK: 암시적 반환 표현
/*
 클로저가 반환하는 값이 있다면
 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급한다
 */
result = calculate(a: 10, b: 10) {
    $0 + $1
}
print(result)

// 간결하게 한 줄로도 표현 가능
result = calculate(a: 10, b: 10) {$0 + $1}

print(result)




