import UIKit

@@discardableResult
func sayHelloString() -> String {
    print("hi")
    return "안녕하세요"
}

sayHelloString() // discardableResult 안쓰면 반환값을 사용하지 않으므로 노란 경고창 뜸
_ = sayHelloString() // 노란 경고창 안뜨게 하려면 와일드카드 패턴 써도 된다



