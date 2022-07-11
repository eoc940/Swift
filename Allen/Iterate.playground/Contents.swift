import UIKit

// for

let a = (1...10).reversed()

for i in a {
    print(i)
}

for num in stride(from: 1, through: 15, by: 2) {
    print(num)
}


// while

var sum = 0
var num = 1

while num <= 50 {
    print(num)
    num += 1
}

// repeat - while
// java의 do - while과 유사
var i = 1

repeat {
    print(i)
    i += 1
} while i <= 9

// 제어전송문

// continue

for num in 1...20 {
    if num % 2 == 0 {
        continue
    }
    print(num)
}

// break

for num in 1...20 {
    if num % 2 == 0 {
        break
    }
}
// Labeled Statements
    
OUTER: for i in 0...3 {
    INNER: for j in 0...3 {
        if i > 1 {
            continue OUTER // default는 INNER에 적용되지만 이렇게 하면 OUTER에 적용됨
        }
        print("\(i) \(j)")
    }
}

for i in 1...5 {
    for _ in 1...i {
        print("G", terminator: "")
    }
    print()
}





