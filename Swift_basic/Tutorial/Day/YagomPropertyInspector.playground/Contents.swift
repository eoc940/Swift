import UIKit

// 프로퍼티 감시자
struct Money{
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        // willset은 바뀌기 직전에 호출됨
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        // didset은 바뀐 직후에 호출됨
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }

    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willset의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
    }
    
    // 연산 프로퍼티
    var won : Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket : Money = Money()

moneyInMyPocket.currencyRate = 1150

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)


/*
 프로퍼티 감시자의 기능은
 함수, 메서드, 클로저, 타입 등의 외부에 위치한
 지역 / 전역 변수에도 모두 사용 가능하다
 */

var a: Int = 100 {
    willSet {
        print("\(a)에서 \(newValue)로 변경될 예정입니다")
    }
    didSet {
        print("\(oldValue)에서 \(a)로 변경되었습니다")
    }
}

a = 200

