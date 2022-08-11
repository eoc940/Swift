import UIKit

// 저장 속성

struct Bird {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func fly() {
        print("fly away")
    }
}

var aBird = Bird(name: "참새1", weight: 0.2)
aBird.name
aBird.weight

var bBird = Bird(name: "참새2", weight: 0.3)
bBird.name
bBird.weight

// 지연 저장 속성(lazy stored proterty)

struct Bird1 {
    var name: String
    lazy var weight: Double = 0.2
    
    init(name: String) {
        self.name = name
    }
    
    func fly() {
        print("fly away")
    }
}

var aBird1 = Bird1(name: "새") // 이 순간에는 weight 속성이 초기화되지 않고 메모리에 공간도 없음

aBird.weight // 해당 변수에 접근하는 이 시점에 초기화됨(메모리 공간이 생기고 숫자가 저장됨)

// 지연 속성 사용 이유

class AView {
    var a: Int
    
    // 1) 메모리를 많이 차지할때(예를 들어 이미지)
    lazy var view = UIImageView()
    
    // 2) 다른 속성을 이용해야 할때
    lazy var b: Int = {
        return a * 10
    }()
    
    init(num: Int) {
        self.a = num
    }
}

var view1 = AView(num: 10)

// 계산 속성

// 계산 속성 사용하지 않는 예시 먼저
class Person {
    var birth: Int = 0
    
    var age: Int {
        get {
            return 2021 - birth
        }
        set {
            self.birth = 2021 - newValue
        }
    }
    
    func getAge() -> Int {
        return 2021 - birth
    }
    
    func setAge(_ age: Int) {
        self.birth = 2021 - age
    }
}

var p1 = Person()
p1.birth = 2000
p1.getAge()
p1.setAge(20)
p1.age // get
p1.age = 20 // set












