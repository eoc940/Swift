import UIKit

// guard
// if문을 사용하면 조건을 여러개 나열했을때 들여쓰기가 중첩되는 불편함이 있음

if true {
    print("1")
    if true {
        print("2")
        if true {
            print("3")
        }
    }
}

func checkNumbersOf(password: String) -> Bool {
    
    guard password.count >= 6 else { return false } // early exit
    
    return true
}

checkNumbersOf(password: "123")

