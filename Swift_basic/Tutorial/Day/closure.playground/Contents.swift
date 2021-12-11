import UIKit

// String을 반환하는 클로저
let myName: String = {
    // myName 으로 들어간다
    return "정대리"
}()

print(myName)

// 클로저 정의
// 클로저는 일종의 메서드라고 봐도 된다
let myRealName : (String) -> String = {
    (name: String) -> String in
    return "개발하는 \(name)"
}

print(myRealName("쩡대리"))
