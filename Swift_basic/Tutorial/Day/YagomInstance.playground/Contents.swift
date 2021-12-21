import UIKit

/*
 MARK: 프로퍼티 기본값
 
 스위프트의 모든 인스턴스는 초기화와 동시에
 모든 프로퍼티에 유효한 값이 할당되어 있어야 한다
 프로퍼티에 미리 기본값을 할당해두면
 인스턴스가 생성됨과 동시에 초기값을 지니게 된다
 */
class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}
/*
 하지만 위와 같은 방법은 실용성이 떨어진다
 초기값을 넣어놔야지만 인스턴스를 만들수 있고
 어쨌든 프로퍼티의 값은 내가 변경해서 사용할 것이기 때문이다
 이처럼 프로퍼티의 기본값을 설정하기 어려운 경우에는
 이니셜라이저를 통해
 인스턴스가 가져야 할 초기값을 전달할 수 있다
 */
class PersonB {
    var name: String
    var age: Int
    var nickName: String? // 꼭 필요한 프로퍼티가 아닐때 이렇게 넣어줌
    
    // initializer
//    init(name: String, age: Int, nickName: String) {
//        self.name = name
//        self.age = age
//        self.nickName = nickName
//    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }
    
}
let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")

/*
 암시적 추출 옵셔널은
 인스턴스 사용에 꼭 필요하지만
 초기값을 할당하지 않고자 할 때 사용
 */
class Puppy {
    var name: String
    var owner: PersonB!
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
// happy.goOut() -> 여기서 owner에 값이 들어있지 않기 때문에 오류
happy.owner = hana
happy.goOut()

/*
 MARK: 실패 가능한 이니셜라이저
 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우
 인스턴스 생성에 실패할 수 있다
 인스턴스 생성에 실패하면 nil을 반환한다
 그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입이다
 */
class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        if name.count == 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}
// let john: PersonD = PersonD(name: "john", age: 23)
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker) // nil
print(batman) // nil

/*
 MARK: 디이니셜라이저
 
 deinit은 클래스의 인스턴스가
 메모리에서 해제되는 시점에 호출된다
 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있다
 */
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonB
    
    init(name: String, child: PersonB) {
        self.name = name
        self.child = child
    }
    
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}
var donald: PersonE? = PersonE(name: "donald", child: hana)
donald?.pet = happy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제된다
// donald가 jenny에게 happy를 인도한다





