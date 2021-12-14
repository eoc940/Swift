import UIKit

// 에러는 enum타입으로 만들 수 있다
// 타입이 에러인것
enum MismatchError: Error {
    case nameMismatch
    case numberMismatch
}

// throws 는 에러를 던진다
// throw를 만나면 에러를 던지고 함수가 종료된다
func guessMyName(name input: String) throws {
    print("guessMyName() called")
    if input != "쩡대리" {
        print("틀렸다")
        throw MismatchError.nameMismatch
    }
    print("맞췄다")
}

// 에러가 있더라도 처리하지 않겠다는 경우는 try? 를 붙여준다
try? guessMyName(name: "쩡대리")
// try!는 에러가 무조건 없을거다라는 의미 -> 밑줄은 에러난다
// try! guessMyName(name: "쩡대리")

// do-catch 블럭 활용
do {
   try guessMyName(name: "이대리")
} catch {
    print("잡은 에러 : \(error)")
}


/// 번호를 맞춘다
/// - Parameter input: 사용자 숫자 입력
/// - Returns: 맞췄는지 여부
func guessMyNumber(name input: Int) throws -> Bool {
    print("guessMyName() called")
    if input != 10 {
        print("틀렸다")
        throw MismatchError.numberMismatch
    }
    print("맞췄다")
    return true
}

do {
   let receivedValue = try guessMyNumber(name: 10)
} catch {
    print("잡은 에러 : \(error)")
}
