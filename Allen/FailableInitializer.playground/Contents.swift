import UIKit

struct Animal {
    let species: String
    
    init?(species: String) { // init? 가 실패가능 생성자
        if species.isEmpty {
            return nil // 생성자 내에서 실패 가능 부분에 nil을 리턴하면 됨
        }
        self.species = species
    }
}

let a = Animal(species: "Giraffe")

let b = Animal(species: "")

enum TemperatureUnit {
    case kelvin
    case celsius
    case fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let c: TemperatureUnit = TemperatureUnit.celsius

let f: TemperatureUnit? = TemperatureUnit(symbol: "F")

enum TemperatureUnit1: Character {
    case kelvin = "K"
    case celsius = "C"
    case fahrenheit = "F"
}

// 원시값이 있는 열거형은 자동으로 실패가능 생성자 init?(rawValue : ) 를 구현함 -> 일치하면 인스턴스 생성, 아니면 nil
let f1: TemperatureUnit1? = TemperatureUnit1(rawValue: "F")

let u: TemperatureUnit1? = TemperatureUnit1(rawValue: "X") // nil
 

struct Item {
    var name = ""
    
//    init() {
//        self.init(name: "Hello") // 실패불가능 생성자가 실패가능 생성자 호출 불가
//    }
//
//    init?(name: String) {
//        self.name = name
//    }
}

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

// 온라인 쇼핑 카트의 항목을 모델링
class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("\(twoSocks.name) \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("생성됨")
} else {
    print("cannot initialize")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("initialized")
} else {
    print("cannot initialize")
}


class Document {
    var name: String?
    
    init() {
    
    }
    
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

let autoDoc = AutomaticallyNamedDocument(name: "")
autoDoc.name

class UntitledDocument: Document {
    override init() {
        super.init(name: "Untitled")!
    }
}
