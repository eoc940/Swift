import UIKit

class Dog {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name) 가 앉았습니다")
    }
    
    func layDown() {
        print("\(name) 가 누웠습니다")
    }
    
    func play() {
        print("\(name) 가 열심히 놉니다")
    }
    
    func changeName(newName name: String) {
        self.name = name
    }
}

let bori = Dog(name: "보리", weight: 20.0)

bori.sit()
bori.layDown()
bori.play()

bori.changeName(newName: "말썽쟁이보리")
bori.sit()
bori.layDown()
bori.play()

let choco = Dog(name: "초코", weight: 20.0)

choco.sit()
choco.layDown()
choco.play()



class Dog1 {
    static var species = "Dog"
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name) 가 앉았습니다")
    }
    
    func trainning() {
        print("월월 저는 \(Dog1.species) 입니다")
        sit()
        sit()
        self.sit() // self 는 그냥 명확하게 지칭하는 것일 뿐
    }
    
    func changeName(newName name: String) {
        self.name = name
    }
}

print()

let bori1 = Dog1(name: "보리", weight: 20.0)
bori1.trainning()


// 구조체

struct Dog2 {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name) 가 앉았습니다")
    }
    
    func sit(a: String) {
        print("\(name) \(a) 가 앉았습니다")
    }
    
    func layDown() {
        print("\(name) 가 누웠습니다")
    }
    
    func play() {
        print("\(name) 가 열심히 놉니다")
    }
    
    mutating func changeName(newName name: String) {
        self.name = name
    }
}

var d7 = Dog2(name: "뽀리", weight: 10)
d7.sit()
d7.sit(a: "????")

class Dog3 {
    static var species: String = "Dog"
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name) 가 앉았습니다")
    }
    
    func layDown() {
        print("\(name) 가 누웠습니다")
    }
    
    func play() {
        print("\(name) 가 열심히 놉니다")
    }
    
    func changeName(newName name: String) {
        self.name = name
    }
    
    class func letmeKnow() { // static으로 써도 가능. class는 상속도 가능하지만 static은 재정의 불가
        print("종은 항상 \(Self.species) 입니다")
    }
}

print()

let bori3 = Dog3(name: "보리", weight: 20.0)
bori3.sit()

bori3.changeName(newName: "말썽쟁이보리")
bori3.sit()

Dog3.letmeKnow()





