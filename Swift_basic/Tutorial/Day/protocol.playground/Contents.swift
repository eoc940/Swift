import UIKit

// 약속
// **able, **ing 이렇게 많이 이름을 붙임
protocol Naming {
    // get set은 값을 넣을수도 있고 얻어올 수도 있다는 뜻
    var name: String { get set }
    // 이런 메서드를 가지고 있는다라고 약속
    func getName() -> String
    
}

struct Friend : Naming {
    var name: String
    
    func getName() -> String {
        return "내 친구:" + self.name
    }
}

var myFriend = Friend(name: "정대리")

myFriend.getName()
