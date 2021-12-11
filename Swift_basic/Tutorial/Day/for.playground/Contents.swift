import UIKit

// 레인지(범위)
// 0...5 -> 0,1,2,3,4,5 즉 처음과 끝을 모두 포함
// 0..<5 -> 0,1,2,3,4 마지막을 포함하지 않음
for i in 0...5 {
    print(i)
}

for i in 0..<5 {
    print(i)
}

for i in 0..<6 where i % 2 == 0 {
    print("짝수 : \(i)")
}

var randomInt : [Int] = []

for _ in 0..<25 {
    let randomNumber =  Int.random(in: 0...100)
    randomInt.append(randomNumber)
}

print("randomInt : \(randomInt)")
print("randomInt 원소 갯수 : \(randomInt.count)")
