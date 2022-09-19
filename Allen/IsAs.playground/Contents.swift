import UIKit

var greeting = "Hello, playground"

class Person {
    var id = 0
    var name = "name"
    var email = "abc@gmail.com"
    
    func walk() {
        print("person walk")
    }
}

class Student: Person {
    var studentId = 1
    
    override func walk() {
        print("student walk")
    }
    func study() {
        print("student study")
    }
}

class Undergraduate: Student {
    var major = "major"
    
    override func walk() {
        print("under walk")
    }
    override func study() {
        print("under study")
    }
    func party() {
        print("under party")
    }
}

let person1 = Person()
person1.id
person1.name
person1.email
 
let student1 = Student()
student1.id
student1.name
student1.email
student1.studentId
 
let undergraduate1 = Undergraduate()
undergraduate1.id
undergraduate1.name
undergraduate1.email
undergraduate1.studentId
undergraduate1.major
// is -> 타입인지 아닌지를 확인
person1 is Person
person1 is Student
person1 is Undergraduate

student1 is Person
student1 is Student
student1 is Undergraduate

undergraduate1 is Person
undergraduate1 is Student
undergraduate1 is Undergraduate

// as?! -> 다운캐스팅
let person: Person = Undergraduate()
person.id
person.name
person.email
//person.studentId
//person.major

let ppp = person as? Undergraduate // person을 Undergraduate 타입으로 변환
ppp?.major
ppp?.studentId

let pp: Undergraduate = person as! Undergraduate
pp.major
pp.studentId

// as -> 업캐스팅
let under: Undergraduate = Undergraduate()

let p = under as Person
p.id
p.name
p.email


// 브릿징 -> 서로 호환되는 형식을 캐스팅해서 쉽게 사용
let str: String = "Hello"
let otherStr = str as NSString

// 타입과 다형성
let p1 = Person()
p1.walk()

let s1: Person = Student()
s1.walk() //
//s1.study()

let u1: Person = Undergraduate()
u1.walk()
//u1.study()
//u1.party()


// 다형성
let people: [Person] = [Person(), Student(), Undergraduate()]

for person in people {
    person.walk()
}

// Any, AnyObject

var some: Any = "Swift"

(some as! String).count

some = 10

(some as! Int).hashValue

some = 3.2

// Any의 장점 : 모든 타입을 '담을 수 있는 배열 생성 가능
let array: [Any] = [5, "hello", 3.5, Person(), {(name: String) in return name}]

(array[1] as? String)?.count

// AnyObject
let objArray: [AnyObject] = [Person(), Student(), Undergraduate()]

(objArray[0] as! Person).name

for (index, item) in array.enumerated() {
    switch item {
    case is Int:
        print("\(index)")
    case let num as Double:
        print("\(index) \(num)")
    case is String:
        print("\(index)")
    case let person as Person:
        print("\(person.name) \(person.id)")
    case is (String) -> String:
        print("\(index)")
    default:
        print("\(index)")
    }
}

let optionalNumber: Int? = 3
print(optionalNumber)
print(optionalNumber as Any)
