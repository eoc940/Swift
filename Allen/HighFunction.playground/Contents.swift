import UIKit

// map
let numbers = [1,2,3,4,5]

let mapping = numbers.map { num in
    "\(num)"
}

print(mapping)
 
let alphabet = ["A","B","C","D"]

let aaa = alphabet.map { str in
    str + "!!!"
}

print(aaa)


// filter

let names = ["Apple","Black","Circle","Dream","Blue"]

let fff = names.filter { str in
    return str.contains("B")
}

print(fff)

let array = [1,2,3,4,5,6,7,8]

var evenNums = array.filter { num in
    num % 2 == 0
}

evenNums = array.filter { $0 % 2 == 0 }
print(evenNums)

func isEven(i: Int) -> Bool {
    return i%2 == 0
}

var fff1 = array.filter(isEven(i:))
print(fff1)

evenNums = array.filter { $0 % 2 == 0}
    .filter { $0 < 5 }

print(evenNums)

var numberArray = [1,2,3,4,5,6,7,8,9,10]

var aaa1 = numberArray.reduce(0) { a, b in
    return a + b
}
print(aaa1)

var bbb1 = numberArray.reduce(100) { $0 - $1}
print(bbb1)

var aaa2 = numberArray.reduce("0") { result, item in
    return result + String(item)
}
print(aaa2)

// numberArray에서 홀수만 제곱해서 그 숫자를 다 더하면?
var aaa3 = numberArray
    .filter { $0 % 2 != 0 }
    .map { $0 * $0 }
    .reduce(0) { $0 + $1 }

print(aaa3)

// foreach

let immutableArray = [1,2,3,4,5]

immutableArray.forEach { num in
    print(num)
}

// compactmap
// 옵셔널 요소를 제거하고 새로운 배열을 리턴
let stringArray: [String?] = ["A", nil, "B", nil, "C"]

var newStringArray = stringArray.compactMap { $0 }
print(newStringArray)

let numbers1 = [-2,-1,0,1,2]

var positiveNumbers = numbers1.compactMap { $0 >= 0 ? $0 : nil }
print(positiveNumbers)

// flatmap
var nestedArray = [[1,2,3], [4,5,6], [7,8,9]]

print(nestedArray.flatMap { $0 })

var newNestedArray = [[[1,2,3],[4,5,6],[7,8,9]],[[10,11],[12,13,14]]]
print(newNestedArray.flatMap { $0 })
print(newNestedArray.flatMap { $0 }.flatMap { $0})
