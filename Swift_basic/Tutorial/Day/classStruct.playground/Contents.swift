import UIKit

/*
 struct
 유튜버(데이터) 모델 - struct / 구조체
 */
struct YoutuberStruct {
    var name : String
    var subscriberCount : Int
}

print("=============struct=============")

var devJeong = YoutuberStruct(name: "정대리", subscriberCount: 9999)

var devJeongClone = devJeong

print("값 넣기 전 devJeongClone.name : \(devJeongClone.name)")

devJeongClone.name = "호롤롤로"

print("값 넣기 후 devJeongClone.name : \(devJeongClone.name)")
print("값 넣기 후 devJeong.name : \(devJeong.name)")

/*
 class
 
 */
class YoutuberClass {
    var name : String
    var subscriberCount : Int
    
    // 생성자 - 즉 메모리에 올린다
    // init으로 매개변수를 가진 생성자 메소드를 만들어야
    // 매개변수를 넣어서 그 값을 가진 객체를 만들 수 있다
    init(name: String, subscribersCount: Int) {
        self.name = name
        self.subscriberCount = subscribersCount
    }

}

print("=============class=============")

var jeongDaeri = YoutuberClass(name: "정대리", subscribersCount: 99999)
var jeongDaeriClone = jeongDaeri

print("값 넣기 전 jeongDaeriClone.name : \(jeongDaeriClone.name)")

jeongDaeriClone.name = "호롤롤롤로"

print("값 넣기 후 jeongDaeriClone.name : \(jeongDaeriClone.name)")

print("값 넣기 후 jeongDaeri.name : \(jeongDaeri.name)")

/*
 struct의 경우 다른 종이에 복사하여 하나의 종이에 조작을 한다고 해서
 다른 종이에 영향이 있지 않음
 class의 경우 서로 연결되어 있다. 두 종이가 연동이 되어 있어 하나에 조작을
 가하면 다른 쪽도 영향을 받게 된다. 즉 두 종이가 하나의 메모리 공간을 참조한다
 */
