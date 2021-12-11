import UIKit

var myAge = -1 {
    willSet{
        print("값이 설정될 예정이다. myAge : \(myAge)")
    }
    didSet{
        print("값이 설정되었다. myAge : \(myAge)")
    }
}

myAge = 11
myAge = 22
