import UIKit

// break

var num = 3

switch num {
case 1:
    break // 아무 동작도 안하면 비워두지 말고 break를 넣어주어야 함
case 2:
    print(num)
case 3:
    print(num)
default:
    print("??")
}


// fallthrough

switch num {
case 1:
    break // 아무 동작도 안하면 비워두지 말고 break를 넣어주어야 함
case 2:
    print(num)
case 3:
    print(num)
    fallthrough
case 4:
    print("hi") // fallthrough때문에 case 4라는 조건을 확인하지 않고 실행됨
case 5:
    print(num)
default:
    print("??")
}


// continue

for i in 1...10 {
    if i % 2 != 0 {
        continue
    }
    print(i)
}


// return

func doSomething() {
    print("1")
    print("2")
    
    if true {
        return
    }
    
    print("3")
}

doSomething()


