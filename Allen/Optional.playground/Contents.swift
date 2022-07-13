import UIKit


var yourName: String
yourName = "asher"

print(yourName) // 만약 값이 초기화되지 않으면 에러


// 위와 같은 상황을 방지하기 위해 옵셔널이 도입됨

var yourName2: String?

print(yourName2)


var name: String = "Jobs"
var newName: String = "Musk"

// name = nil   String 타입에 nil 할당 불가

var name1: String? = "Jobs"
var newName1: String? = "Musk" // String? 을 Optional<String> 으로도 표현 가능

name1 = nil
print(newName1)

// 타입 살펴보기
var a: Int? = 7
var b = a
print(b)

var c: Int = 5
b = c
print(b) // Int를 Int? 타입에 담을 수는 있다. 타입이 Int?로 바뀌어 들어간다

// 옵셔널 타입끼리 연산 불가
var n1: Int? = 3
var n2: Int? = 4
// print(n1 + n2)



// 옵셔널 추출

var num: Int?
var str: String? = "hi"

// 1. 강제 추출
print(str!)
//print(num!) 에러

// 2. if 로 nil 확인 후 추출

if str != nil {
    print(str!)
}
if num != nil {
    print(num!)
}

// 3. 옵셔널 바인딩

if let s = str { // s라는 상수에 담긴다면 -> nil이 아니라면
    print(s)
}

var optionalName: String? = "hong"

if let name = optionalName {
    print(name)
}

func doSomething(name: String?) {
    guard let n = name else { return }
    print(n)
}

doSomething(name: "hello")
doSomething(name: Optional<String>("hello2"))


// 4. nil 병합 연산자

var realName = optionalName ?? "no"


// 옵셔널 바인딩 연습









