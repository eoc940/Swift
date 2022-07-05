import UIKit

var num = 9

// fallthrough는 그 다음 case의 조건을 보지 않고 그 다음 case 안의 코드들을 실행한다. case 10이 아닌데도 print("2")를 한다
switch num {
case ..<10:
    print("1")
    fallthrough
case 10:
    print("2")
    fallthrough
default:
    print("3")
}

// 범위연산자 0,1...49,50
0...50

// 패턴매칭 연산자(범위에 들어가는지 아닌지 bool값 반환)
let a = 0...50
let num1 = 30
a ~= num1
let b = 51...100
b ~= num1

switch num1 {
case 0...50: // 0...50 ~= num1 을 내부적으로 계산
    print("0부터 50")
default:
    print("그 외")
}


0..<5 // 0,1,2,3,4 이다. 5를 포함안함

var temp = 19

switch temp {
case ..<0:
    print("영하")
default:
    print("영상")
}


// 바인당

var c = 7

let d = c // 이 경우가 바인딩이다. 다른 변수/상수의 새로운 식별자로 할당한다

// 스위치문에서의 바인딩
var number = 2

switch number {
case let a: // let a = number
    print("숫자 \(a)")
default:
    break
}

switch number {
case let n where n <= 7: // switch문에서 조건절 쓸때는 바인딩(let n = number)후에 where로 조건을 단다
    print("under 7")
default:
    print("rest number")
}

switch number {
case var x where x < 5: // 변수로 바인딩도 가능 var x = number
    x = 7
    print(x)
default:
    print(num)
}

// 가위바위보 게임
enum Hand: String {
    case scissor = "가위"
    case rock = "바위"
    case paper = "보"
}

let comNum = Int.random(in: 0...2)

func convert(num: Int) -> Hand {
    switch num {
    case 0:
        return .scissor
    case 1:
        return .rock
    default: // case 2
        return .paper
    }
}

let comHand = convert(num: comNum)
let myHand: Hand = .scissor

switch myHand {
case .scissor:
    switch comHand {
    case .scissor:
        print("무승부")
    case .rock:
        print("패배")
    case .paper:
        print("승리")
    }
case .rock:
    switch comHand {
    case .scissor:
        print("승리")
    case .rock:
        print("무승부")
    case .paper:
        print("패배")
    }
case .paper:
    switch comHand {
    case .scissor:
        print("패배")
    case .rock:
        print("승리")
    case .paper:
        print("무승부")
    }
}

// 랜덤 빙고 게임
let comNumber = Int.random(in: 1...10)
let myNumber = 5

let result: String = comNumber == myNumber ? "Bingo" : (comNumber > myNumber ? "Down" : "Up")
print(comNumber)
print(result)
