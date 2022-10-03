import UIKit

// 명령형 프로그래밍
let numbers = [1,2,3]

var sum = 0

for number in numbers {
    sum += number
}

print(sum)

// 함수형 프로그래밍
let newNumbers = [1,2,3]
var newSum = 0

newSum = newNumbers.reduce(0, { $0 + $1 })
print(newSum)


