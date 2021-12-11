import UIKit

// foreach 반복문

// 콜렉션
// 배열
var myArray : [Int] = [0,1,2,3,4,5,6,7,8,9,10]

// set
// dictionary
// 이것들도 콜렉션임

// 대충 파이썬과 비슷하게 foreach문 돌릴 수 있음
for item in myArray {
    print("item: \(item)")
}

// foreach문에 where 절로 조건을 달 수도 있음
for item in myArray where item > 5 {
    print("5보다 큰 수 : \(item)")
}

for item in myArray where item % 2 == 0 {
    print("짝수 : \(item)")
}

