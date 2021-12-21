import UIKit

// MARK: Class vs Struct/Enum

struct ValueType {
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)")
print("second struct instance property : \( secondStructInstance.property)")
// 값을 복사하는 것이기 때문에 다르게 나온다

class ReferenceType {
    var property = 1
}

let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class instance property : \(firstClassReference.property)")
print("second class instance property : \(secondClassReference.property)")
// 주소를 복사하는 것이기 때문에 같은 주소를 참조하므로 같게 나온다







