import UIKit

class SomeClass {
    private var name = "이름"
    
    func nameChange(name: String) {
        self.name = name
    }
}

var s = SomeClass()
//s.name = "홍길동" -> 이렇게 프로퍼티에 직접 접근 불가
s.nameChange(name: "홍길이")


 
// 싱글톤

class Singleton {
    static let shared = Singleton()
    private init() {} // 새로운 객체 생성 불가하도록
    var userInfoId = 12345
}

Singleton.shared

let object = Singleton.shared
object.userInfoId = 54321

Singleton.shared.userInfoId

let object2 = Singleton.shared
object2.userInfoId = 34521

Singleton.shared.userInfoId


// 실제 사용 예시
let screen = UIScreen.main
let userDefaults = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default



 
