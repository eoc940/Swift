import UIKit

class Dogg {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

var choco: Dogg? = Dogg(name: "choco", weight: 15.0)
var bori: Dogg? = Dogg(name: "bori", weight: 10.0)

choco = nil // RC : 0
// release(choco)
bori = nil // RC : 0
// release(bori)

// ARC

var dog1: Dogg?
var dog2: Dogg?
var dog3: Dogg?

dog1 = Dogg(name: "댕댕이", weight: 7.0) // RC + 1  RC == 1
dog2 = dog1  // RC + 1  RC == 2
dog3 = dog1  // RC + 1  RC == 3

dog3?.name = "깜둥이"
dog2?.name
dog1?.name

dog3 = nil // RC -1  RC == 2
dog2 = nil // RC -1  RC == 1
dog1 = nil // RC -1  RC == 0  ->  메모리 해제

// memory leak
class Dog {
    var name: String
    var owner: Person?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Person {
    var name: String
    var pet: Dog?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

var bory: Dog? = Dog(name: "보리")
var gildong: Person? = Person(name: "홍길동")

bory?.owner = gildong
gildong?.pet = bory

//이것도 nil로 해야 해제됨. 안하면 해제 안됨
bory?.owner = nil
gildong?.pet = nil

bory = nil
gildong = nil

// weak 키워드로 해결
class Dog1 {
    var name: String
    weak var owner: Person1? // Person의 RC 올리지 않음
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Person1 {
    var name: String
    weak var pet: Dog1? // Dog의 RC 올리지 않음
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}
var bory1: Dog1? = Dog1(name: "보리1")
var gildong1: Person1? = Person1(name: "홍길동1")

bory1 = nil
gildong1 = nil


// unowned 키워드로 해결
class Dog2 {
    var name: String
    unowned var owner: Person2? // Person의 RC 올리지 않음
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Person2 {
    var name: String
    unowned var pet: Dog2? // Dog의 RC 올리지 않음
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}
var bory2: Dog2? = Dog2(name: "보리2")
var gildong2: Person2? = Person2(name: "홍길동2")

bory2 = nil
gildong2 = nil

// unowned의 경우 참조하고 있던 인스턴스가 사라지면 nil로 초기화 되지 않음

// 캡처 현상
func calculate(number: Int) -> Int {
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += (num * num)
        return sum
    }
    
    let result = square(num: number)
    return result
}


func calculateFunc() -> ((Int) -> Int) {
    var sum = 0
    func square(num: Int) -> Int {
        sum += (num * num)
        return sum
    }
    return square
}

var squareFunc = calculateFunc()

squareFunc(10)
squareFunc(20)
squareFunc(30)


// 밸류 타입 캡처와 캡처리스트
var num = 1

let valueCaptureClosure = {
    print("밸류값 출력 : \(num)")
}

num = 7
valueCaptureClosure()

num = 1
valueCaptureClosure()

let valueCaptureListClosure = { [num] in
    print("밸류값 출력 : \(num)")
}

num = 7
valueCaptureListClosure() // 1 출력됨


// 참조 타입 캡쳐와 캡처리스트

class SomeClass {
    var num = 0
}

var x = SomeClass()
var y = SomeClass()

let refTypeCapture = { [x] in
    print("참조 출력값(캡처리스트) : \(x.num)  \(y.num) " )
}

x.num = 1
y.num = 1

print(x.num, y.num)

refTypeCapture()

print(x.num, y.num)

var z = SomeClass()

let refTypeCapture1 = { [weak z] in
    print("weak capture list : ", z?.num )
}

refTypeCapture1()

// 캡처리스트 안에서 바인딩도 가능
var s = SomeClass()

let capTureBinding = { [newS = s] in
    print("바인딩의 경우 :", newS.num)
}

let captureWeakBinding = { [weak z = s] in
    print("weak 바인딩의 경우 :", z?.num)
}
capTureBinding()
captureWeakBinding()
