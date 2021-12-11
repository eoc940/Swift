import UIKit

struct MyArray<SomeElement> {
    // 제네릭을 담은 빈 배열
    var elements : [SomeElement] = [SomeElement]()
    
    // 생성자
    init(_ elements: [SomeElement]) {
        self.elements = elements
    }
}

struct Friend {
    var name: String
}

struct PpakCoder {
    var name: String
}

var mySomeArray = MyArray([1,2,3])
print("mySomeArray : \(mySomeArray)")

var myStringArray = MyArray(["가","나","다","라"])
print("myStringArray : \(myStringArray)")

let friend_01 = Friend(name: "철수")
let friend_02 = Friend(name: "영희")
let friend_03 = Friend(name: "수진")

var myFriendsArray = MyArray([friend_01, friend_02, friend_03])
print("myFriendsArray : \(myFriendsArray)")
