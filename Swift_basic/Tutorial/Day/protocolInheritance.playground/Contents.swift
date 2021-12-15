import UIKit

protocol Naming {
    var name: String {get set}
    func getName() -> String
}

protocol Aging {
    var age: Int {get set}
}

// protocol 다중 상속 가능
protocol UserNotifiable : Naming, Aging {
    
}

class MyBestFriend :UserNotifiable {
    var name: String
    
    func getName() -> String {
        <#code#>
    }
    
    var age: Int = 0 = 0
    
    
}

struct MyFriend : UserNotifiable {
    var name: String
    
    func getName() -> String {
        <#code#>
    }
    
    var age: Int
}
