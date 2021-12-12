import UIKit

class Friend {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func sayHi(){
        print("안녕? 난 \(self.name)이라고 해")
    }
}

// 상속은 : 을 사용한다
class BestFriend : Friend {
    // override로 부모의 메소드를 가져온다
    override init(_ name: String) {
        
        // 부모의 생성자를 호출해 주어야 함
        super.init("베프 " + name)
    }
    
    override func sayHi() {
        super.sayHi()
    }
}

let myFriend = Friend("쩡대리")

myFriend.sayHi()

let myBestFriend = BestFriend("영희")

myBestFriend.sayHi()

myBestFriend.name // 베프 영희



