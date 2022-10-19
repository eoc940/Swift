import UIKit

let now = Date()

print(now)

now.timeIntervalSinceReferenceDate

//캘린더
var calender = Calendar.current
Calendar(identifier: .gregorian)

let year: Int = calender.component(.year, from: now)
print(year)


enum Weekday: Int {
    case sun = 1, mon, tue, wed, thu, fri, sat
    
    static var today: Weekday {
        let weekday = Calendar.current.component(.weekday, from: Date())
        return Weekday(rawValue: weekday)!
    }
}

let today = Weekday.today

// DateFormatter

let formatter = DateFormatter()

formatter.dateStyle = .full
formatter.timeStyle = .full
let someString1 = formatter.string(from: Date())
print(someString1)

formatter.dateFormat = "yyyy/MM/dd"

let someString2 = formatter.string(from: Date())
print(someString2)


// 실제 프로젝트 활용 방식

var components = DateComponents() // 구조체
components.year = 2021
components.month = 1
components.day = 1

let specifiedDate: Date = Calendar.current.date(from: components)!
print(specifiedDate)

extension Date {
    // 구조체 실패가능 생성자로 구현
    init?(y year: Int, m month: Int, d day: Int) {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        guard let date = Calendar.current.date(from: components) else {
            return nil
        }
        self = date // 구조체이기 때문에 self에 새로운 인스턴스를 할당하는 방식으로 초기화가능
    }
}

let someDate = Date(y: 2021, m: 1, d: 1)
let someDate2 = Date(y: 2021, m: 7, d: 10)
