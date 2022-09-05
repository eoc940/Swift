import UIKit

class Aclass {
    func doSomething() {
        print("do something")
    }
}

class Bclass: Aclass {
    override func doSomething() {
        super.doSomething()
         print("do something - 1")
    }
}

var b = Bclass()
b.doSomething()



class SomeSuperclass {
    var aValue = 0
    
    func doSomething() {
        print("do something")
    }
}

class SomeSubclass: SomeSuperclass {
    // 저장속성 재정의 원칙적 불가
    // override var aValue: Int = 3
    
    // 저장속성 -> 계산속성으로 재정의 가능
    // 그러나 메서드 형태로 부수적 추가 가능
    override var aValue: Int {
        get {
            return 1
        }
        set {
            super.aValue = newValue
        }
    }
    
    override func doSomething() {
        
        super.doSomething()
        print("do something 2")
        super.doSomething()
    }
    
}


class Vehicle {
    var currentSpeed = 0.0
    
    var halfSpeed: Double {
        get {
            return currentSpeed/2
        }
        set {
            currentSpeed = newValue*2
        }
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
    
    // 저장속성 -> 계산속성으로 재정의 가능
//    override var currentSpeed: Double {
//        get {
//            return super.currentSpeed
//        }
//        set {
//            super.currentSpeed = newValue
//        }
//    }
    
    // 저장속성 -> 속성감시자를 추가하는 재정의는 가능
    override var currentSpeed: Double {
        willSet {
            print(currentSpeed, newValue)
        }
        didSet {
            print(oldValue, currentSpeed)
        }
    }
}

class Vehicle1 {
    var currentSpeed = 0.0
    
    var datas = ["1", "2", "3", "4", "5"]
    
    func makeNoise() {
        print("경적을 울린다")
    }
    
    subscript(index: Int) -> String {
        get {
            if index > 4 {
                return "0"
            }
            return datas[index]
        }
        set {
            datas[index] = newValue
        }
    }
}

class Bicycle1: Vehicle1 {
    override func makeNoise() {
        super.makeNoise()
        print("??")
    }
    
    override subscript(index: Int) -> String {
        get {
            if index > 4 {
                return "777"
            }
            return super[index]
        }
        set {
            super[index] = newValue
        }
    }
}

let v = Bicycle1()
v.currentSpeed
v.makeNoise()






