import UIKit

protocol Naming {
    var lastname: String {get set}
    var firstname: String {get set}
    // 프로토콜 메서드는 로직 못넣고 이렇게 바디만 가짐
    func getName() -> String
}

// extension을 활용하면 프로토콜에 로직을 넣을 수 있다
extension Naming {
    func getFullName() -> String {
        return self.lastname + " " + self.firstname
    }
}

struct Friend : Naming {
    var lastname: String
    
    var firstname: String
    
    func getName() -> String {
        return self.lastname
    }
}

let myFriend = Friend(lastname: "쩡", firstname: "대리")

myFriend.getName()
myFriend.getFullName()


