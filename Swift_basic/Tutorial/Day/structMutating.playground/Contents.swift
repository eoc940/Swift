import UIKit

class Friend {
    var name: String
    func changeName(newName: String) {
        self.name = newName
    }
    
    init(_ name: String) {
        self.name = name
    }
}

var myFriend = Friend("쩡대리")

myFriend.changeName(newName: "개발하는 정대리")

myFriend.name

// struct는 생성자를 자동으로 만들어줌
struct BestFriend {
    var name: String
    mutating func changeName(newName: String) {
        // struct는 값, class는 참조이므로 self.이 허용되지 않는다
        // self.name = newName 안됨
        // mutating 키워드를 사용하면 self를 사용하여 멤버변수 변경 가능
        self.name = newName
        print("newName : " + newName)
    }
    
//    init(_ name: String) {
//        self.name = name
//    }
}

var myBestFriend = BestFriend(name: "쩡대리")

myBestFriend.changeName(newName: "호롤롤로")
