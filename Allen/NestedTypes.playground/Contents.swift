import UIKit

class Aclass {
    struct Bstruct {
        enum Cenum {
            case a
            case b
            
            struct Dstruct {
                
            }
        }
        var name: Cenum
    }
}

let aClass: Aclass = Aclass()

let bStruct: Aclass.Bstruct = Aclass.Bstruct(name: .b)

// 실제 api에서 중첩 타입 사용 경우
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = DateFormatter.Style.none


