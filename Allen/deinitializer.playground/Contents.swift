import UIKit

class Aclass {
    var x = 0
    var y = 0
    
    
    deinit {
        print("인스턴스 소멸")
    }
}

var a: Aclass? = Aclass()
a = nil


