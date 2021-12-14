import UIKit

var myNumberSet : Set<Int> = Set<Int>()

myNumberSet.insert(1)
myNumberSet.insert(2)
myNumberSet.insert(2)
myNumberSet.insert(3)
myNumberSet.insert(3)

myNumberSet.count
myNumberSet

for aNumber in myNumberSet {
    print("aNumber :", aNumber)
}

var myFriends : Set<String> = ["철수", "영희", "수지"]
var myBestFriends : [String] = ["철수", "영희", "수지"]

myFriends.contains("철수")
myFriends.contains("정대리")
myBestFriends.contains("수지")

if let indexToRemove = myFriends.firstIndex(of: "수지") {
    // 여기서 인덱스는 배열의 인덱스가 아니라 해쉬의 인덱스임
    print("indexToReomove :", indexToRemove)
    myFriends.remove(at: indexToRemove)
}

myFriends
