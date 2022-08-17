import UIKit

class Profile {
    
    var name: String = "이름"
    
    var statusMessage: String = "기본 상태메시지" {
        willSet(message) { // 바뀔 값이 파라미터로 전달
            print("메시지가 \(statusMessage) 에서 \(message) 로 변경될 예정입니다")
            print("상태메시지 업데이트 준비")
        }
        didSet(message) { // 바뀐 값이 파라미터로 전달
            print("메시지가 \(message) 에서 \(statusMessage) 로 변경될 예정입니다")
            print("상태메시지 업데이트 완료")
        }
    }
    
    var statusMessage1: String = "기본 상태메시지" {
        willSet {
            print("메시지가 \(statusMessage1) 에서 \(newValue) 로 변경될 예정입니다")
            print("상태메시지 업데이트 준비")
        }
        didSet {
            print("메시지가 \(oldValue) 에서 \(statusMessage1) 로 변경될 예정입니다")
            print("상태메시지 업데이트 완료")
        }
    }
}


let p = Profile()

p.name
p.name = "전지현"

p.statusMessage
p.statusMessage = "행복해"

p.statusMessage = "우울해"


