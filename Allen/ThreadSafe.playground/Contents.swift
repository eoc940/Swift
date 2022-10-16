import UIKit

var array = [String]()

let serialQueue = DispatchQueue(label: "serial")

for i in 1...20 {
    DispatchQueue.global().async {
        print("\(i) !")
        
        serialQueue.async {
            array.append("\(i)")
        }
        
    }
}
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    print(array)
}



