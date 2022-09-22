import UIKit
import Darwin

protocol SomeProtocol {
    func playPiano()
}

struct MyStruct: SomeProtocol {
    func playPiano() {
        // 구현
    }
}

// 클래스 상속의 단점
class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("bird lay egg")
        }
    }
    
    func fly() {
        print("bird fly")
    }
}

class Eagle: Bird {
    
    // isFemale
    // layEgg
    // fly   펭귄이 날개됨
    func soar() {
        print("eagle soar")
    }
}

class Penguin: Bird {
    func swim() {
        print("swim")
    }
}

class Airplane: Bird {
    // isFemale
    // layEgg
    override func fly() {
        print("airplane fly using engine")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: Bird) {
        flyingObject.fly()
    }
}

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: Eagle())
museum.flyingDemo(flyingObject: Penguin())
museum.flyingDemo(flyingObject: Airplane())

// 프로토콜 이용
protocol CanFly {
    func fly() // 구현은 하지 않음
}

class Bird1 {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("bird lay egg")
        }
    }
}

class Eagle1: Bird1, CanFly {
    func fly() {
        print("bird fly")
    }
}

struct Airplane1: CanFly {
    func fly() {
        print("airplane fly")
    }
}

struct FlyingMuseum1 {
    func flyingDemo(flyingObject: CanFly) { // 프로토콜을 타입으로 인식
        flyingObject.fly()
    }
}

// 프로토콜 문법
protocol MyProtocol {
    func doSomething() -> Int
}

class FamilyClass {
    
}

class MyClass1: FamilyClass, MyProtocol {
    func doSomething() -> Int {
        return 7
    }
}

struct MyStruct1: MyProtocol {
    func doSomething() -> Int {
        return 7
    }
}

enum MyEnum1: MyProtocol {
    func doSomething() -> Int {
        return 7
    }
}

protocol RemoteMouse {
    var id: String { get } // var로 선언, get은 최소한의 요구사항임. 즉 구현부에서 set해도됨.
    var name: String { get set } // 저장속성 / 읽기,쓰기 계산속성
    static var type: String { get set }
}

struct TV: RemoteMouse {
    let id: String = "456"
    var name: String = "samsung tv" // get set이기 때문에 let 사용불가
    static var type: String = "remote control"
}

class SmartPhone: RemoteMouse {
    var id: String {
        return "777"
    }
    var name: String {
        get { "아이폰" }
        set { }
    }
    static var type: String = "리모콘" // 타입 저장 속성은 (상속은 되지만) 재정의 원칙적 불가능
}

class Ipad: RemoteMouse {
    var id: String = "777"
    var name: String = "아이패드"
    
    class var type: String { // 타입 계산 속성은 재정의 가능 (class 키워드 가능)
        get { "리모콘" }
        set { }
    }
}

// 메서드 요구사항 정의
protocol RandomNumber {
    static func reset()
    func random() -> Int
}

class Number: RandomNumber {
    static func reset() {
        print("reset")
    }
    
    func random() -> Int {
        return Int.random(in: 1...100)
    }
}

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var s = OnOffSwitch.off
s.toggle()
s.toggle()
s.toggle()

class BigSwitch: Togglable {
    var isOn = false
    func toggle() {
        isOn = isOn ? false : true
    }
}

// 생성자 요구사항
protocol SomeProtocol1 {
    init(num: Int)
}

class SomeClass: SomeProtocol1 {
    required init(num: Int) { // required init으로 구현해야함. 프로토콜에서 init이 있기 때문
        // 실제 구현
    }
}

class SomeSubClass: SomeClass {
    // 하위 클래스에서 생성자 구현 안하면 필수 생성자는 자동 상속
    // required init(num: Int)
}

protocol APhoto {
    init?(num: Int)
}

struct AStruct: APhoto {
    init(num: Int) {}
}

class AClass: APhoto {
    required init?(num: Int) {}
}

// 서브스크립트 요구사항
protocol DataList {
    subscript(idx: Int) -> Int { get set }
}

struct DataStructure: DataList {
    subscript(idx: Int) -> Int {
        get {
            return 0
        }
        set {
            
        }
    }
}

protocol Certificate {
    func doSomething()
}

class Person {
    
}

extension Person: Certificate {
    func doSomething() {
        print("do something")
    }
}

// 타입으로써의 프로토콜 -> 프로토콜은 타입이다

protocol Remote {
    func turnOn()
    func turnOff()
}

class Tv: Remote {
    func turnOn() {
        print("tv on")
    }
    func turnOff() {
        print("tv off")
    }
}

struct SetTopBox: Remote {
    func turnOn() {
        print("settop on")
    }
    func turnOff() {
        print("settop off")
    }
    func doNetflix() {
        print("netflix see")
    }
}

let tv: Remote = Tv()

let sbox: Remote = SetTopBox()
sbox.turnOn()
sbox.turnOff()
//sbox.doNetflix() - remote 타입이라 메서드 호출 불가

(sbox as? SetTopBox)?.doNetflix()

// 프로토콜 타입 취급 장점
let electronics: [Remote] = [tv, sbox]
for item in electronics {
    item.turnOn()
}
// as 연산자
let newBox = sbox as Remote
newBox.turnOff()
newBox.turnOn()

let sbox2 = electronics[1] as? SetTopBox
sbox2?.doNetflix()

// 프로토콜의 상속
protocol AirConRemote {
    func up()
    func down()
}

protocol SuperRemoteProtocol: Remote, AirConRemote {
    func doSomething()
}

class HomePot: SuperRemoteProtocol {
    func doSomething() {
        
    }
    
    func turnOn() {
        
    }
    
    func turnOff() {
        
    }
    
    func up() {
        
    }
    
    func down() {
        
    }
}

// 클래스 전용 프로토콜
protocol SomeProtocol2: AnyObject { // AnyObject는 클래스 전용 프로토콜
    func doSomething()
}

//클래스에서만 채택 가능
class Aclass: SomeProtocol2 {
    func doSomething() {
        
    }
}

// 프로토콜의 합성
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}

struct Person1: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("\(celebrator.name) \(celebrator.age)")
}


let birthdayPerson = Person1(name: "22", age: 33)
let whoIsThis: Named & Aged = birthdayPerson
wishHappyBirthday(to: whoIsThis)

// 선택적 요구사항의 구현
@available(iOS 13.0, macOS 10.12, *)
class SomeType {
    
}

// objc
@objc protocol Remote3 {
    @objc optional var isOn: Bool { get set } // optional 붙은거는 구현해도 되고 안해도 됨
    func turnOn()
    func turnOff()
    @objc optional func doNetflix()
}

class TV3: Remote {
    func turnOn() {}
    func turnOff() {}
}

// 프로토콜 확장
extension Remote {
    func turnOn() {print("remote on")}
    func turnOff() {print("remote off")}
    
    func doAnotherAction() {
        print("another action")
    }
}

var tv7 = TV3()
tv7.turnOn()
tv7.turnOff()
tv7.doAnotherAction()


