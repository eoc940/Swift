import UIKit

/*
 () -> Void
 이것은
 func completion() {
 
 }
 과 같다고 보면 된다
 */

// completion이라는 클로저를 매개변수로 가지는 메소드 정의
func sayHi(completion: () -> Void) {
    print("sayHi() called")
    sleep(2) // 2초 동안 멈추기
    // completion 클로저 실행
    completion()
}

// 메소드 호출부에서 이벤트 종료를 알 수 있다
sayHi(completion: {
    print("2초가 지났다")
})

sayHi() {
    print("2초가 지났다2")
}

sayHi {
    print("2초가 지났다3")
}


/*
 (String) -> Void
 이것은
 func completion(userInput: String) {
 
 }
 이것과 같다
 */

// 매개변수로서 데이터를 반환하는 클로저
func sayHiWithName(completion: (String) -> Void) {
    print("sayHiWithName() called")
    sleep(2)
    // 클로저를 실행과 동시에 데이터를 반환
    completion("오늘도 빡코딩 하고 계신가요?!")
}

sayHiWithName(completion: {
    (comment: String) in
    print("2초 뒤에 그가 말했다! comment :", comment)
})

sayHiWithName(completion: {
    comment in
    print("2초 뒤에 그가 말했다! comment :", comment)
})

sayHiWithName {
    comment in
    print("2초 뒤에 그가 말했다! comment :", comment)
}

sayHiWithName {
    // $0 은 첫번째를 받겠다는 의미
    print("2초 뒤에 그가 말했다! comment :", $0)
}

/*
 (String, String) -> Void
 이것은
 func completion(first: String, second: String) {
 
 }
 과 같다
 */

// 매개변수로서 데이터를 반환하는 클로저
func sayHiWithFullName(completion: (String, String) -> Void) {
    print("sayHiWithFullName() called")
    sleep(2)
    // 클로저를 실행과 동시에 데이터를 반환
    completion("오늘도 빡코딩 하고 계신가요?!", "호롤롤로")
}

sayHiWithFullName { first, second in
    print("첫번쩨 : \(first), 두번째 : \(second)")
}

// _ 를 써서 사용하지 않겠다는 표현 가능
sayHiWithFullName { _, second in
    print("두번째 : \(second)")
}

sayHiWithFullName {
    print("첫번쩨 : \($0), 두번째 : \($1)")
}

func sayHiOptional(completion: (() -> Void)? = nil) {
    print("sayHiOptional() called")
    sleep(2)
    // completion 클로저 실행
    completion?()
}

// sayHiOptional {
//
// }

sayHiOptional() // 클로저 실행 안하고 함수만 실행하고 싶을 때

sayHiOptional(completion: {
    print("2초가 지났다")
})

/*
 (Int) -> String
 이것은
 func transform(number: Int) -> String {
    return "숫자 : \(number)"
 }
 */

var myNumbers : [Int] = [0,1,2,3,4,5]

//var transformedNumbers = myNumbers.map { aNumber in
//    return "숫자 : \(aNumber)"
//}
// 위와 같은 표현
//var transformedNumbers = myNumbers.map { (aNumber: Int) -> String in
//    return "숫자 : \(aNumber)"
//}
// 위와 같은 표현
var transformedNumbers = myNumbers.map {
    return "숫자 : \($0)"
}


