import UIKit

var set1: Set = [1,2,1,1,3,4,2,3]
print(set1)

// 빈 set 생성
let emptySet: Set<Int> = []
let empty = Set<Int>()

// set의 기본 기능
set1.count
set1.isEmpty
set1.contains(1)
set1.randomElement()

// 서브스크립트 관련 문법 없음
set1.update(with: 1) // 1이라는 값 추가 -> 이미 들어가 있어서 저장 안됨
set1.update(with: 7) // 7이라는 값 추가

// 삭제하기
var stringSet: Set<String> = ["Apple", "Banana", "City", "Swift"]

stringSet.remove("Swift") // 삭제된 값을 옵셔널로 리턴

stringSet.removeAll()
stringSet.removeAll(keepingCapacity: true)


// 부분집합 / 상위칩합 / 서로소
var a: Set = [1,2,3,4,5,6,7,8,9]
var b: Set = [1,3,5,7,9]
var c: Set = [2,4,6,8,10]
var d: Set = [1,7,5,9,3]

b.isSubset(of: a) // 부분집합이므로 true 리턴
b.isStrictSubset(of: a) // 진부분집합(동일하지 않으며 부분집합임)이므로 true 리턴

a.isSuperset(of: b) // 상위집합이므로 true 리턴
a.isStrictSubset(of: b) // 진상위집합이므로 true 리턴

d.isDisjoint(with: c) // 서로소(부분집합이 없음)이므로 true 리턴

// 합집합
var unionSet = b.union(c) // b 자체가 변경되지는 않음
b
//b.formUnion(c) // b 자체가 변경됨
b

// 교집합
var interSet = a.intersection(b) // 원본변경 x
//a.formIntersection(b) // 원본변경

var subSet = a.subtracting(b)
//a.subtract(b) // 원본변경

// 반복문과의 결합
let iterateSet: Set = [1,2,3]

for num in iterateSet {
    print(num)
}

// 기타 유의점
var newSet: Set = [1,2,3,4,5]
var newArray: Array = newSet.sorted()




