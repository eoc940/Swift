import UIKit

// struct도 메소드 가질 수 있음
struct Friend {
    var age: Int
    var name: String
    
    func sayHello() -> String {
        print("sayHello()")
        return "저는 \(age)살, \(name)입니다"
    }
}
// struct는 생성자 안만들어도 자동으로 생김
var myFriend = Friend(age: 10, name: "쩡대리")
myFriend.sayHello()
