import UIKit


enum SomeError: Error {
    case aError
    case bError
    case cError
}

func doSomething(num: Int) throws -> Bool {
    
    if num >= 7 {
        return true
    } else {
        
        if num < 0 {
            throw SomeError.aError
        }
        return false
    }
}

try? doSomething(num: 7)

// 에러처리과정 3단계

enum HeightError: Error {
    case maxHeight
    case minHeight
}

func checkingHeight(height: Int) throws -> Bool {
    if height > 190 {
        throw HeightError.maxHeight
    } else if height < 130 {
        throw HeightError.minHeight
    } else {
        if height >= 160 {
            return true
        } else {
            return false
        }
    }
}

// 에러 발생가능한 함수처리 -> try와 do-catch문으로 처리
do {
    var result = try checkingHeight(height: 160)
    print("결과값 : \(result)")
} catch HeightError.maxHeight {
    print("키가 커서 불가능")
} catch HeightError.minHeight {
    print("키가 작아서 불가능")
}

do {
    var result = try checkingHeight(height: 160)
    print("결과값 : \(result)")
} catch HeightError.maxHeight, HeightError.minHeight {
    print("키가 문제다")
}

do {
    var result = try checkingHeight(height: 100)
    print("결과값 : \(result)")
} catch { // error 상수를 제공. 모든 에러가 넘어옴
    print(error.localizedDescription)
    if let error = error as? HeightError {
        switch error {
        case .maxHeight:
            print("키가 커서 불가능")
        case .minHeight:
            print("키가 작아서 불가능")
        }
    }
}

// try? -> 옵셔널 타입으로 리턴
let isChecked = try? checkingHeight(height: 200)

// try! -> 에러 안나는 경우에만 사용 가능
let isChecked1 = try! checkingHeight(height: 180)





