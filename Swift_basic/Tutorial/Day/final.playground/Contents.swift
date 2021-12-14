import UIKit

/*
 Friend 클래스는 상속이 가능한 상태이다
 만약 상속을 불가능하게 하려면
 final class Friend {
 로 하면 된다
 */
class Friend {
    var name : String
    
    init(name: String){
        self.name = name
    }
}

class BestFriend : Friend {
    override init(name: String) {
        super.init(name: "베프 " + name)
    }
}

let myFriend = Friend(name: "쩡대리")
let myBestFriend = BestFriend(name: "철수")
