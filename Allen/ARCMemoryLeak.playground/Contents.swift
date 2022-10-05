import UIKit

class Dog {
    var name = "초코"
    
    var run: (() -> Void)?
    
    func walk() {
        print("\(self.name)가 걷는다")
    }
    
    func saveClosure() {
        run = { [weak self] in
            print("\(self?.name)가 뛴다")
        }
    }
    
    deinit {
        print("\(self.name) 메모리 해제")
    }
}

func doSomething() {
    let choco: Dog? = Dog()
    choco?.saveClosure()
}

doSomething()

// 캡처리스트 실제 사용 예시

class ViewController: UIViewController {
    var name: String = "뷰컨"
    
    func doSomething() {
        DispatchQueue.global().async {
            sleep(3)
            print("글로벌큐에서 출력하기 : \(self.name)")
        }
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

func localScopeFunction() {
    let vc = ViewController()
    vc.doSomething()
}

localScopeFunction()

class ViewController1: UIViewController {
    var name: String = "뷰컨"
    
    func doSomething() {
        DispatchQueue.global().async { [weak self] in
            sleep(3)
            print("글로벌큐에서 출력하기 : \(self?.name)")
        }
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

func localScopeFunction1() {
    let vc = ViewController1()
    vc.doSomething()
}

localScopeFunction1()
