import UIKit

var dic = ["A": "Apple", "B": "Banana", "C": "City"]
let dic1 = ["B": "Banana", "C": "City", "A": "Apple"]

print(dic)
print(dic1)

// 딕셔너리 타입 표기
// 단축
var words: [String: String] = [:]
// 정식
let word1: Dictionary<Int, String>

// 빈 딕셔너리 생성
let emptyDict1: Dictionary<Int, String> = [:]
let emptyDict2 = Dictionary<Int, String>()
let emptyDict3 = [Int: String]()

// 딕셔너리 기본 기능
emptyDict1.count
emptyDict1.isEmpty

emptyDict1.randomElement() // Named Tuple 형태로 리턴

if let a = dic["A"] {
    print(a)
} else {
    print("Not found")
}
// if let 안쓰는 경우
dic["S", default: "Empty"]

print(dic.keys)
print(dic.values)

// 딕셔너리 업데이트
words.updateValue("City", forKey: "C")


// 삭제
dic["B"] = nil
dic["E"] = nil // 키가 없어도 에러가 일어나지는 않음

// 딕셔너리 비교

var a = ["A": "Apple", "B": "Banana", "C": "City"]
var b = ["B": "Banana", "C": "City", "A": "Apple"]

a == b // 순서가 상관없기 때문에 같다

// 딕셔너리 중첩 사용
var dict1 = [String: [String]]()

dict1["arr1"] = ["a", "b", "c"]

var dict2 = [String: [String: Int]]()

dict2["arr1"] = ["name": 1, "age": 2]

// 반복문과의 결합

let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
    print("\(key) \(value)")
}

for (_, value) in dict {
    print("\(value)")
}






