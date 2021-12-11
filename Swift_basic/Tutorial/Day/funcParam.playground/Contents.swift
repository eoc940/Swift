import UIKit

// 함수, 메소드 정의
func myFunction(name: String) -> String {
    return "안녕하세요?! \(name) 입니다!"
}

// 함수, 메소드를 호출한다. call
myFunction(name: "정대리")

// 함수, 메소드 정의
// with(with가 아니라 아무거나 와도 됨)는 여기서 name이라는 파라미터를
// 대신한 이름이라고 볼 수 있다
func myFunctionSecond(with name: String) -> String {
    return "안녕하세요?! \(name) 입니다!"
}

myFunctionSecond(with: "호롤롤로")
// with로 바꾸었기 때문에 name이라는 파라미터명으로 사용 불가
// myFunctionSecond(name: "????")

// 함수, 메소드 정의
// 호출부에서 파라미터 변수명 쓰고 싶지 않으면 함수 선언부 파라미터에 _ 넣어준다
func myFunctionThird(_ name: String) -> String {
    return "안녕하세요?! \(name) 입니다!"
}

myFunctionThird("하하하하")

