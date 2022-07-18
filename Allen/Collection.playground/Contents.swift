import UIKit

// array

var numsArray: [Int] = [1,2,3,4,5]

let numsArray1: Array<Int> = [20,2,7,4,5,7]

var stringArray = ["Apple","Swift","iOS","Hello","iOS"]


// array의 기능

numsArray.count
numsArray.isEmpty

numsArray.contains(5)

numsArray.randomElement() // 랜덤으로 하나 뽑음

numsArray.swapAt(0, 1)
print(numsArray)
// subscript문법(대괄호를 이용한 특별한 함수)
stringArray[0]
stringArray[2]
stringArray[3]

stringArray[1] = "Dart"
print(stringArray)

stringArray.first // first, last는 Optional을 리턴한다
stringArray.last
print(type(of: stringArray.first))

stringArray.startIndex
stringArray.endIndex // 마지막 index + 1 이 출력됨

stringArray[stringArray.startIndex]
stringArray[stringArray.endIndex - 1]

stringArray.index(1, offsetBy: 2)

stringArray.firstIndex(of: "iOS") //firstIndex, lastIndex는 Optional을 리턴한다
stringArray.lastIndex(of: "iOS")
print(type(of: stringArray.firstIndex(of: "iOS")))

if let index = stringArray.firstIndex(of: "C") {
    print(index)
    stringArray[index]
}


// insert

var alphabet = ["A","B","C","D","E","F","G"]

alphabet.insert("H", at: 7)

alphabet

// replace

alphabet[0] = "a"

alphabet[0...2] = ["x","y","z"]

alphabet[0...1] = []
alphabet

// replace하기 위한 문법
alphabet.replaceSubrange(0...2, with: ["a","b","c"])


// append

alphabet = ["A","B","C","D","E","F","G"]

alphabet.append("H")
alphabet.append(contentsOf: ["H","I"])

// remove

alphabet[0...2] = []

alphabet.remove(at: 2)

alphabet.removeSubrange(0...2)

alphabet = ["A","B","C","D","E","F","G"]

alphabet.removeFirst()
alphabet.removeFirst(2) // 앞에서 2개 지움

alphabet.removeLast()
alphabet.removeLast(2) // 뒤에서 2개 지움


alphabet.removeAll(keepingCapacity: true) // 메모리 공간을 일단 보관해 둠(데이터만 일단 날림)
alphabet.removeAll()

// 기타 기능

var nums = [1,3,1,2,5,2,3,5,6,7]

var newArray = nums.sorted()
newArray
nums
nums.sort()

// 특정 요소 삭제

var puppy1 = ["p", "u", "p", "p", "y"]

if let lastIndexOfP = puppy1.lastIndex(of: "p") {
    puppy1.remove(at: lastIndexOfP)
}

if !nums.isEmpty {
    print("\(nums.count) elements")
} else {
    print("empty")
}

// 배열의 배열 접근
var data = [[1,2,3], [4,5,6], [7,8,9]]

data[0][2]

nums = [10,13,15,24,63]

for i in nums { // nums가 배열
    print(i)
}

for tuple in nums.enumerated() {
    print("\(tuple.0) \(tuple.1)")
}

for (index, value) in nums.enumerated() {
    print(index, value)
}

for (index, value) in nums.enumerated().reversed() {
    print(index, value)
}








