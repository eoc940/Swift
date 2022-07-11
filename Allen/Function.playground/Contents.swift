import UIKit

// function

func doSomething(a: Int) -> Int { // a 는 파라미터
    return a * 3
}

doSomething(a: 3) // 3 은 아규먼트

func sayHello() -> String {
    return "hi"
}

print(sayHello() + " sir") // String에 + 사용가능

// argument label

func printName(first name: String) {
    print(name)
}

printName(first: "newton") // first는 argument label인데 함수가 무엇을 원하는지 명확하게 드러낼 수 있다. 함수 선언 내 파라미터는 간단하게 사용할 수 있다

// argument label 생략
func printName2(_ name: String) {
    print(name)
}

printName2("asher")

// 가변 파라미터

func arithmeticAverage(_ numbers: Double...) -> Double {
    var total = 0.0
    
    numbers.forEach { num in
        total += num
    }
    
    return total / Double(numbers.count)
}

// 함수의 파라미터에 기본값 정하는 것도 가능

func numFunction(num1: Int, num2: Int = 5) -> Int {
    return num1 + num2
}

numFunction(num1: 5)

print("hi", "fff", separator: "   ", terminator: "%%") // 함수 선언부 보면 seperator, terminator가 default값이 들어가 있고, 변경하고 싶으면 사용하면 된다

// 함수 사용시 주의점

func someAdd(a: Int) -> Int { // a는 let이다
    // a += 1
    var b = a
    b += 1
    return b
}

someAdd(a: 5)

// 리턴 타입이 없을 때 return 사용 -> 함수 종료
func numberprint(n num: Int) {
    if num >= 5 {
        print("over 5")
        return
    }
    print("under 5")
}


// 함수의 중첩 사용
// 함수 안에 함수 작성
func chooseStepFunction(backward: Bool, value: Int) -> Int {
    
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    if backward {
        return stepBackward(input: value)
    } else {
        return stepForward(input: value)
    }
}

chooseStepFunction(backward: true, value: 4)


// 함수 지칭

numberprint(n: ) // numberPrint n 함수이다
var some = chooseStepFunction(backward:value:)
some(true, 5)


// 함수 타입 표기

var func1: (Int) -> () = numberprint(n:)

var func2: (Bool, Int) -> Int = chooseStepFunction(backward:value:)


// 함수의 오버로딩
// 함수명이 같을 때, 파라미터가 다르거나 리턴타입이 다르면 여러개 함수 정의 가능

func doAnything(value: Int) {
    print(value)
}

func doAnything(value: Double) {
    print(value)
}

func doAnything(value: Double) -> Double {
    return value + 1
}


