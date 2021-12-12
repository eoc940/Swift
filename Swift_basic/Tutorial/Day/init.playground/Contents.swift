import UIKit

class MyFriend {
    
    var name : String
    
    init(_ name: String = "이름없음") {
        self.name = name
        print("init : MyFriend가 메모리에 올라갔다")
    }
    deinit{
        print("deinit : 메모리에서 사라짐 - ", self.name)
    }
    
    // deinit 검증을 위해 작성
    var calledTimes = 0
    let MAX_TIMES = 5
    
    static var instancesOfSelf = [MyFriend]()
    class func destroySelf(object: MyFriend) {
        instancesOfSelf = instancesOfSelf.filter{ (aFriend :MyFriend) in
            aFriend !== object
        }
    }
    func call(){
        calledTimes += 1
        print("called \(calledTimes)")
        if calledTimes > MAX_TIMES {
            MyFriend.destroySelf(object: self)
        }
    }
}

let myFriend = MyFriend("쩡대리")
let aFriend = MyFriend()

// Unmanaged.passUnretained(객체).toOpaque()
// 이걸로 해당 객체의 메모리 주소를 프린트할 수 있다
let anObjectMemoryAddress = Unmanaged.passUnretained(aFriend).toOpaque()
let secondObjectMemoryAddress = Unmanaged.passUnretained(myFriend).toOpaque()

print(anObjectMemoryAddress)
print(secondObjectMemoryAddress)

// strong은 해당 인스턴스의 소유권을 가진다
// weak는 해당 인스턴스의 소유권을 가지지 않고 주소값만을 가지고 있는 포인터 개념이다. 메모리가 해제될 경우 자동으로 레퍼런스가 nil로 초기화를 해준다. weak 속성을 사용하는 객체는 항상 optional 타입이어야 한다(해당 객체가 nil일 수 있기 때문)
weak var aFriendToBeDestroyed = MyFriend("개발하는 정대리")

if aFriendToBeDestroyed != nil {
    aFriendToBeDestroyed?.call()
    print("???")
} else {
    print("객체가 더이상 메모리에 없습니다")
}
