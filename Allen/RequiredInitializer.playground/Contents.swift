import UIKit

class Aclass {
    var x: Int
    required init(x: Int) { // 필수 생성자
        self.x = x
    }
}

class Bclass: Aclass {
//    required init(x: Int) {
//        super.init(x: x)
//    }
}

class Cclass: Aclass {
    init() {
        super.init(x: 0)
    }
    
    required init(x: Int) {
        super.init(x: x)
    }
}

class AView: UIView {
    
    // init을 구현하면, 자동상속되었던 required init을 구현해주어야 한다.
//    init() {
//        super.init()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

class BView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

