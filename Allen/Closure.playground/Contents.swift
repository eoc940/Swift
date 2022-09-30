import UIKit

func aFunction(str: String) -> String {
    return "Hello, \(str)"
}

// 위를 클로저로 나타내면
let _ = {(str: String) -> String in
    return "Hello \(str)"
}

let aClosureType = { () -> () in
    print("hi")
}

aClosureType()

// 클로저 형태
let _ = {(a: Int, b: Int) -> Int in
    let result = a + b
    return result
}

let _: (Int, Int) -> Int = {(a, b) in // 타입 추론 가능할땐 파라미터에 안 써도 됨
    let result = a + b
    return result
}

let closureType4 = { str in
    return str + "!" // string과 더할 수 있는건 string뿐이므로 타입이 자동 추론됨
}

// 클로저를 사용하는 이유

func closureParamFunction(closure: () -> ()) {
    print("start print")
    closure()
}

func printSwiftFunction() {
    print("finish print")
}

let printSwift = { () -> () in
    print("finish print")
}

closureParamFunction(closure: printSwiftFunction)
closureParamFunction(closure: printSwift) 

closureParamFunction {
    print("closure hihi")
}

// 클로저를 파라미터로 받는 함수 정의
func closureCaseFunction(a: Int, b: Int, closure: (Int) -> Void) {
    let c = a+b
    closure(c)
}

closureCaseFunction(a: 7, b: 7, closure: { param -> () in
    print("hi \(param)")
})


// 후행 클로저

closureParamFunction(closure: {
    print("terminate print")
})

closureParamFunction(closure: ) {
    print("terminate print")
}


closureParamFunction() {
    print("terminate print")
}

closureParamFunction {
    print("terminate print")
}

closureCaseFunction(a: 3, b: 4) { num in
    print("\(num)")
}


func performClosure(param: (String) -> Int) {
    param("Swift")
}

performClosure(param: {(str: String) in
    return str.count
})

performClosure(param: { str in
    return str.count
})

performClosure(param: { str in
    str.count
})

performClosure {
    $0.count
}


// 앱에서 활용 예시

URLSession(configuration: .default).dataTask(with: URL(string: "https://address")!) { data, response, error in
    // 데이터 처리 코드
    print()
}

var count = 0
Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
    if count < 4 {
        print("ddd")
        count += 1
    } else {
        timer.invalidate()
    }
}

// multiple trailing closure

func multipleClosure(first: () -> (), second: () -> (), third: () -> ()) {
    first()
    second()
    third()
}

multipleClosure {
    print("first")
} second: {
    print("second")
} third: {
    print("third")
}

func multipleClosure2(first: () -> (), _ second: () -> (), third: () -> ()) {
    first()
    second()
    third()
}

multipleClosure2 {
    print("first")
} _: {
    print("second")
} third: {
    print("third")
}


// 클로저의 캡처

var stored = 0

let closure = { (number: Int) -> Int in
    stored += number
    return stored
}

closure(3)
closure(4)
closure(5)

stored = 0

closure(5)

func calculate(number: Int) -> Int {
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += num * num
        return sum
    }
    
    let result = square(num: number)
    return result
}


calculate(number: 10)
calculate(number: 20)
calculate(number: 30)

func calculateFunc() -> ((Int) -> Int) {
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += num * num
        return sum
    }
    
    return square
}

var squareFunc = calculateFunc() // square함수를 리턴해서 squareFunc에 할당됨

squareFunc(10)
squareFunc(20)
squareFunc(30)

// 레퍼런스 타입
var dodoFunc = squareFunc
dodoFunc(20)

// @escaping

func performEscaping1(closure: () -> ()) {
    print("start print")
    closure()
}

performEscaping1 {
    print("end print")
}

var aSavedFunction: () -> () = {print("print")}

func performEscaping2(closure: @escaping () -> ()) {
    aSavedFunction = closure
}

aSavedFunction()

performEscaping2 {
    print("print differently")
}

aSavedFunction() // 여기서 출력되는 것임

func performEscaping1(closure: @escaping (String) -> Int) {
    var name = "gildong"
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        closure(name)
    }
}

// autoclosure -> 파라미터 없는 클로저만 가능
func someFunction(closure: @autoclosure () -> Bool) {
    if closure() {
        print("true")
    } else {
        print("false")
    }
}

var num = 1

someFunction(closure: true) // { true } 형식으로 만들어준다 즉 클로저로 자동으로 만들어준다

someFunction(closure: num == 1)

// autoclosure는 기본적으로 non-escaping임. escaping속성 가지려면 써줘야함


