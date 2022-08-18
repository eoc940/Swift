import UIKit

class SomeData {
    var datas = ["Apple", "Swift", "iOS", "Hello"]
    
    subscript(index: Int) -> String {
        get {
            return datas[index]
        }
        set(paramName) {
            datas[index] = paramName
        }
    }
}

var data = SomeData()
data.datas[3]
data[0]

struct TimesTable {
    let multiplier: Int = 3
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable()
threeTimesTable[2]
threeTimesTable[3]

struct Matrix {
    var data = [[1,2,3], [4,5,6], [7,8,9]]
    
    subscript(row: Int, column: Int) -> Int? {
        if row >= 3 || column >= 3 {
            return nil
        }
        return data[row][column]
    }
}

var mat = Matrix()

mat[0, 1]! // 이렇게 두 개의 파라미터 전달 가능

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, ruanus, neptune
    
    static subscript(n: Int) -> Self {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)
