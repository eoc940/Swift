import UIKit

class Color {
    let red: Double
    let green: Double
    let blue: Double
    
    // 생성자도 오버로딩 가능
//    init() {
//        red = 0.0
//        green = 0.0
//        blue = 0.0
//    }
//
//    init(white: Double) {
//        red = white
//        green = white
//        blue = white
//    }
    convenience init() { // 생성자 내에서 다른 생성자를 호출할 때는 convenience를 붙여주어야 한다(편의 생성자)
        self.init(red: 0.0, green: 0.0, blue: 0.0)
    }
    
    convenience init(white: Double) {
        self.init(red: white, green: white, blue: white)
    }
    
    init(red: Double, green: Double, blue: Double) { // 지정 생성자
        self.red = red
        self.green = green
        self.blue = blue
    }
}

var c = Color()
var c1 = Color(white: 2.2)
var c2 = Color(red: 1, green: 2, blue: 3)

// 구조체는 멤버와이즈 이니셜라이저 자동 제공(wise : ~와 관련된 -> 멤버와 관련된 초기화 제공), 기본 생성자도 자동 제공
struct Color1 {
    var red: Double
    var green: Double
    var blue: Double
    // 생성자 구현 안해도 오류 안남
}

var c3 = Color1(red: 1, green: 2, blue: 3)


// 상속의 경우

class Aclass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    convenience init() {
        self.init(x: 0, y: 0)
    }
}

class Bclass: Aclass {
    var z: Int
    
    init(x: Int, y: Int, z: Int) {
        self.z = z
        // self.y = 3 // y에 접근 불가능(메모리 세팅 전임)
        // self.doSomething() // 메모리 세팅 전이라 메서드 호출 안됨
        super.init(x: x, y: y)
        self.y = 7 // y에 접근 가능
        
        self.doSomething() // 메모리 세팅 후라 메서드 호출 가능
    }
    
    convenience init(z: Int) {
        self.init(x: 0, y: 0, z: z)
    }
    
    convenience init() {
        self.init(z: 0)
    }
    
    func doSomething() {
        print("do something")
    }
}







