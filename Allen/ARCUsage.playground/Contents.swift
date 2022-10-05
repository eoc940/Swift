import UIKit

class Dog {
    var name = "초코"
    // 클로저 내에서 객체의 속성 및 메서드에 접근 시에는 self 키워드를 반드시 사용해야함
    func doSomething() {
        DispatchQueue.global().async {
            print("my name is \(self.name) 입니다")
        }
    }
}

var choco = Dog()
choco.doSomething()

class Person {
    let name = "홍길동"
    
    func sayMyName() {
        print("my name is \(name)")
    }
    
    func sayMyName1() {
        DispatchQueue.global().async {
            print("my name is \(self.name)")
        }
    }
    
    func sayMyName2() {
        DispatchQueue.global().async { [weak self] in
            print("my name is \(self?.name)")
        }
    }
    
    func sayMyName3() {
        DispatchQueue.global().async { [weak self] in
            guard let weakSelf = self else { return }
            print("my name is \(weakSelf)")
        }
    }
}


