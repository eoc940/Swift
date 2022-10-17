import UIKit

enum HeightError: Error {
    case maxHeight
    case minHeight
}

// throwing함수
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

do {
    let _ = try checkingHeight(height: 200)
    print("놀이기구 타기 가능")
} catch {
    print("놀이기구 타는거 불가능")
}

// Result 타입을 사용한 에러처리
// 에러는 동일하게 정의되어 있다고 가정
// Result 타입에는 성공/실패했을 경우에 대한 정보가 다 들어있음
func resultTypeCheckingHeight(height: Int) -> Result<Bool, HeightError> {
    if height > 190 {
        return Result.failure(HeightError.maxHeight)
    } else if height < 130 {
        return Result.failure(HeightError.minHeight)
    } else {
        if height >= 160 {
            return Result.success(true)
        } else {
            return Result.success(false)
        }
    }
}

let result = resultTypeCheckingHeight(height: 200)

switch result {
case .success(let data):
    print("결과값은 \(data) 입니다")
case .failure(let error):
    print(error)
}
