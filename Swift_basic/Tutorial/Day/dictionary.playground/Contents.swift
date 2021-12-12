import UIKit

// 키 : 값
var myFriends = ["bestFriend" : "쩡대리",
                 "highschool" : "영희"
]

let myBestFriend = myFriends["bestFriend"]

let highSchoolFriend = myFriends["highschool"]

let youtubeFriend = myFriends["youtube", default: "친구없음"]

myFriends["bestFriend"] = "개발하는 정대리"

let myBF = myFriends["bestFriend"]

myFriends["newFriend"] = "철수"

let newFriend = myFriends["newFriend"]

myFriends.updateValue("수잔", forKey: "girlFriend")

let girlFriend = myFriends["girlFriend"]

myFriends.updateValue("짹슨", forKey: "bestFriend")

let myBestFriend2 = myFriends["bestFriend"]

// 빈 dictionary 만들기
let emptyDictionary : [String : Int] = [:]
let emptyDictionary2 = [String : Int]()
let emptyDictionary3 : [String : Int] = Dictionary<String, Int>()

myFriends.count

for item in myFriends {
    print("item :", item)
}

