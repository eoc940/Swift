import UIKit

var num1 = 10
var num2 = 20

// inout은 주소를 가져옴
func swapToInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

swapToInts(&num1, &num2)

print(num1)
print(num2)

// 만약 Double형을 바꾼다면? String형을 바꾼다면 -> 새로운 함수를 만들어 줘야 함

func swapValues<T>(_ a: inout T, _ b: inout T) { // 꺽쇠의 의미는 그 문자를 사용할거라는 의미... 미리 정의하는 의미
    let tempA = a
    a = b
    b = tempA
}

var string1 = "hello"
var string2 = "world"

swapValues(&string1, &string2)
print(string1)
print(string2)

// 스위프트 컬렉션은 제네릭으로 되어있음
let array1: Array<String> = ["cook", "musk"]
let dict1: Dictionary<String, Int> = ["alex":25, "michel":18]

// 제네릭 구조체, 클래스, 열거형
struct Member {
    var members: [String] = []
}

struct GenericMember<T> {
    var members: [T] = []
}

let g = GenericMember(members: [1,2,3]) // 이 순간에 타입이 Int로 고정됨

class GridPoint<A> {
    var x: A
    var y: A
    
    init(x: A, y: A) {
        self.x = x
        self.y = y
    }
}

let aPoint = GridPoint(x: 10, y: 20)
let bPoint = GridPoint(x: 10.4, y: 20.5)

enum Pet<T> {
    case dog
    case cat
    case etc(T)
}

let animal = Pet.etc("고슴도치")

// 제네릭 구조체의 확장

// 정의
struct Coordinates<T> {
    var x: T
    var y: T
}

extension Coordinates { // Coordinates<T> (X)
    // 튜플로 리턴하는 메서드
    func getPlace() -> (T, T) {
        return (x, y)
    }
}

let place = Coordinates(x: 5, y: 5)
print(place.getPlace())

// where절 추가 가능
// Int 타입에만 적용되는 확장과 getIntArray() 메서드
extension Coordinates where T == Int {
    // 배열로 리턴하는 메서드
    func getIntArray() -> [T] {
        return [x, y]
    }
}

print(place.getIntArray())


// 타입 제약
// Equatable 프로토콜 채택한 타입만 해당 함수에서 사용가능 하다는 제약
func findIndex<T: Equatable>(item: T, array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if item == value {
            return index
        }
    }
    return nil
}

let aNumber = 5
let someArray = [3,4,5,6]

if let index = findIndex(item: aNumber, array: someArray) {
    print("밸류값과 같은 배열의 인덱스 : \(index)")
}

// 클래스 제약의 예시
class Person {}
class Student: Person {}

let person = Person()
let student = Student()

func personClassOnly<T: Person>(array: [T]) { // Person 클래스를 상속한 클래스만 사용 가능
    // 함수 내용 정의
    
}

personClassOnly(array: [person, person])
personClassOnly(array: [student, student])



// 프로토콜에서의 제네릭
protocol RemoteControl {   // <T> 의 방식이 아님
    associatedtype T       // 연관형식은 대문자로 시작해야함
    func changeChannel(to: T) // 관습적으로 Element를 많이 사용
    func alert() -> T?
}

// 연관형식이 선언된 프로토콜을 채택한 타입은, typealias로 실제 형식을 표시해야함
struct TV: RemoteControl {
    typealias T = Int // 이부분 주석처리하고 아래 T를 Int로 써도됨
    
    func changeChannel(to: T) {
        print("TV 채널바꿈 : \(to)")
    }
    
    func alert() -> T? {
        return 1
    }
}

class Aircon: RemoteControl {
    func changeChannel(to: String) {
        print("TV 채널바꿈 : \(to)")
    }
    
    func alert() -> String? {
        return "1"
    }
}

// 연관 형식에 제약 추가 가능
protocol RemoteControl2 {   // <T> 의 방식이 아님
    associatedtype Element: Equatable      // 연관형식은 대문자로 시작해야함
    func changeChannel(to: Element) // 관습적으로 Element를 많이 사용
    func alert() -> Element?
}







