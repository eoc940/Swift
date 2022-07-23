import UIKit


class Dog {
    var name = "강아지"
    var weight = 0.0
    
    func sit() {
        print("앉았습니다")
    }
    
}

var bori = Dog()
bori.name
bori.name = "보리"
bori.name

bori.weight
bori.weight = 15
bori.weight

var choco = Dog()
choco.name
choco.name = "초코"
choco.name

choco.weight
choco.weight = 7
choco.weight

struct Bird {
    var name = "새"
    var weight = 0.0
    
    func fly() {
        print("날아갑니다")
    }
}


var aBird = Bird()
aBird.name
aBird.name = "참새1"
aBird.name

var bBird = Bird()
bBird.name
bBird.name = "참새2"
bBird.name

// 클래스와 구조체의 메모리

class Person {
    var name = "사람"
}

struct Animal {
    var name = "동물"
}

var p = Person()
var a = Animal()

p.name
p.name = "해리"

var p2 = p
p2.name

p2.name = "수진"
p.name


a.name
a.name = "강아지"

var a2 = a
a2.name

a2.name = "고양이"
a.name


class PersonClass {
    var name = "사람"
    var age = 0
}

struct AnimalStruct {
    var name = "동물"
    var age = 0
}

let pclass = PersonClass()
let astruct = AnimalStruct()

pclass.name = "사람1"
pclass.name

// astruct.name = "동물1"  struct가 let으로 선언되면 내부 멤버들도 let으로 됨
astruct.name


// 초기화 init

class Dog1 {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
}

var daebak = Dog1(name: "대박", weight: 5.2)
daebak.name
daebak.weight

var dog1 = Dog1.init(name: "수박", weight: 6.1)

class Dog2 {
    var name: String? // 옵셔널 타입이면 값이 초기화되지 않아도 된다
    var weight: Double
    
    init(weight: Double) {
        self.weight = weight
    }
}

var dog777 = Dog2(weight: 10)
dog777.name

// === , !== -> 두개의 참조가 같은 인스턴스(class)를 가리키고 있는지를 비교하는 방법
dog1 === dog777
dog1 !== dog777

 

class Book {
    var name: String
    var price: Int
    var company: String
    var author: String
    var pages: Int
    
    init(name: String, price: Int, company: String, author: String, pages: Int) {
        self.name = name
        self.price = price
        self.company = company
        self.author = author
        self.pages = pages
    }
}

var book1 = Book(name: "swift", price: 30000, company: "apple", author: "jobs", pages: 300)
var book2 = Book(name: "funny", price: 15000, company: "jem", author: "guys", pages: 200)
book2.company = "nojam"









