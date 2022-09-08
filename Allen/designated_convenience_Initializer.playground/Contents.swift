import UIKit
import Darwin

class Aclass {
    var x = 0
    
    // init() {}
}

let a = Aclass()
print(a.x)

// 상위의 지정생성자
// init()

class Bclass: Aclass {
    var y: Int
    
    // 1. 지정생성자로 재정의
    override init() {
        self.y = 0 // 하위 프로퍼티가 먼저 세팅되어야 함
        super.init() // 반드시 상위의 지정생성자를 호출해야 함 - x를 세팅
    }
    // 2. 하위에서 편의생성자로 재정의 -> 반드시 자기 단계의 지정생성자 호출해야됨
//    override convenience init() {
//        self.init(y: 0)
//    }
//    init(y: Int) {
//        self.y = y
//        super.init()
//    }
    
    // 3. 구현 안해도됨(반드시 재정의할 필요 없음)
    init(y: Int) {
        self.y = y
        super.init()
    }
}

// 상위의 지정생성자
// init()
// init(y: Int)

class Cclass: Bclass {
    var z: Int
    
    override init() {
        self.z = 0
        super.init()
    }
    
    override init(y: Int) {
        self.z = 0
        super.init(y: y)
    }
    
    init(z: Int) {
        self.z = z
        super.init()
    }
}

class Vehicle {
    var numberOfWheels = 0
    
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}

let vehicle = Vehicle()
print(vehicle.description)


class Bicycle: Vehicle {
    override init() {
        super.init() // 저장속성이 없으므로 상위 지정생성자만 호출해도 됨
        numberOfWheels = 2
    }
}

class Hoverboard: Vehicle {
    var color: String
    
    // (읽기) 계산 속성 재정의
    override var description: String {
        return "\(super.description) \(color)"
    }
    
    override convenience init() {
        self.init(color: "red")
    }
    
    init(color: String) {
        self.color = color
        super.init()
    }
}

// 지정생성자와 편의생성자 실제 사례

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unnamed")
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()
mysteryMeat.name

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
//    convenience init() {}  // 자동 상속(예외 규칙)
}

let oneMysteryItem = RecipeIngredient() // 편의생성자
oneMysteryItem.name
oneMysteryItem.quantity

let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)



class ShoppingListItem: RecipeIngredient {
    var purchased = false
    
    var description: String {
        var output = "\(quantity) \(name)"
        output += purchased ? "d" : "f"
        return output
    }
}






