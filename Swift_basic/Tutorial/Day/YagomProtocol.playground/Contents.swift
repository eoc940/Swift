import UIKit

/*
 프로토콜
 
 프로토콜은 특정 역할을 수행하기 위한
 메서드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의한다
 구조체, 클래스, 열거형은 프로토콜을 채택해서
 프로토콜의 요구사항을 실제로 구현할 수 있습니다
 어떤 프로토콜의 요구사항을 모두 따르는 타입은
 그 프로토콜을 준수한다고 표현한다
 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 기능을
 모두 구현해야 한다
 */

protocol Talkable {
    /*
     프로퍼티 요구
     프로퍼티 요구는 항상 var 키워드를 사용한다
     get은 읽기만 가능해도 상관없다는 뜻이며
     get과 set을 모두 명시하면
     읽기 쓰기 모두 가능한 프로퍼티여야 한다
     */
    var topic: String {get set}
    var language: String {get set}
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}

/*
 MARK: 프로토콜 채택 및 준수
 Person 구조체는 Talkale 프로토콜을 채택했다
 */
struct Person: Talkable {
    var topic: String
    var language: String
    // 읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능하다
//    var language: String { return "한국어" }
    
    // 물론 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체할 수 있다
//    var subject: String = ""
//    var topic: String {
//        set {
//            self.subject = newValue
//        }
//        get {
//            return self.subject
//        }
//    }
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다")
    }
    
    init(topic:String, language:String) {
        self.topic = topic
        self.language = language
    }
    
}

/*
 MARK: 프로토콜 상속
 프로토콜은 클래스와 다르게 다중상속이 가능하다
 */
protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}
protocol ReadSpeakable: Readable {
//    func read()
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
//    func read()
//    func write()
    func speak()
}

struct SomeTtype: ReadWriteSpeakable {
    func read() {
        print("read")
    }
    func write() {
        print("write")
    }
    func speak() {
        print("speak")
    }
}

/*
 클래스에서 상속과 프로토콜 채택을 동시에 하려면
 상속받으려는 클래스를 먼저 명시하고
 그 뒤에 채택할 프로토콜 목록을 작성한다
 */
class SuperClass: Readable {
    func read() {print("read")}
}
class SubClass: SuperClass, Writeable, ReadSpeakable {
    func write() {print("write")}
    func speak() {print("speak")}
}

let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable // true
someAny is ReadSpeakable // false

someAny = sub
someAny is Readable // true
someAny is ReadSpeakable // true

someAny = sup

if let someReadable: Readable = someAny as? Readable {
    someReadable.read() // read
}






