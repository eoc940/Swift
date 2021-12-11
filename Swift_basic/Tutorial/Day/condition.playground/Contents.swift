import UIKit
import Darwin

// 다크모드 여부
var isDarkMode : Bool = false

// 조건
if isDarkMode {
    print("다크모드 입니다")
}else{
    print("다크모드가 아닙니다")
}

var title : String = !isDarkMode ? "다크모드 아니다" : "다크모드 이다"
print(title)

// 조건문 쓰는 방식은 다양함
var isSwift : Bool = true

if isSwift {
    print("스위프트입니다1")
}
if (isSwift) {
    print("스위프트입니다2")
}
if isSwift==true {
    print("스위프트입니다3")
}
if (isSwift==true) {
    print("스위프트입니다4")
}

// 삼항연산자
var study : String = !isSwift ? "스위프트 공부안함" : "스위프트 공부할거임"

print(study)

