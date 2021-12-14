import UIKit

func sayName(_ name: String) {
    print("안녕! 난 \(name) 이라고 해")
}

func sayHi(_ name: inout String) {
    /*
     매개변수는 let의 형태이기 때문에
     아래와 같이 값을 변경할 수 없다.
     값을 변경하고 싶을 경우 매개변수 앞에
     inout 키워드를 붙여준다
     */
    name = "개발하는 " + name
    print("안녕! 난 \(name) 라고 해")
}

sayName("정대리")
/*
 inout 매개변수의 경우 함수 호출부에서 직접
 매개변수를 넣을 수 없고 변수를 하나 받은 후
 변수명을 함수 매개변수로 넣을 수 있다
 */
var name = "쩡대리"
sayHi(&name)
