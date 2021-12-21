import UIKit
import Darwin

/*
 옵셔널 체이닝
 
 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있다
 */

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var guardd: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

/*
 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로
 결과 타입도 옵셔널이다
 
 만약 우리집의 경비원의 직업이 궁금하다면?
 */
// 옵셔널 체이닝을 사용하지 않는다면...
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let guardd = home.guardd {
                if let guardJob = guardd.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

guardJob(owner: yagom)

// 옵셔널 체이닝을 사용하면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guardd?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: yagom)
// 우리집 경비원은 직업이 없어요

yagom?.home?.guardd?.job // nil
yagom?.home = apart
yagom?.home
yagom?.home?.guardd

yagom?.home?.guardd = superman
yagom?.home?.guardd

yagom?.home?.guardd?.name
yagom?.home?.guardd?.job = nil

yagom?.home?.guardd?.job = "경비원"

// nil 병합 연산자
// ?? 앞의 값이 nil 이면 ?? 뒤의 값을 할당한다

//var guardJob: String
//
//guardJob = yagom?.home?.guardd?.job ?? "슈퍼맨"
//print(guardJob) // 경비원
//
//yagom?.home?.guardd.job = nil
//
//guardJob = yagom?.home?.guardd.job ?? "슈퍼맨"
//print(guardJob) // 슈퍼맨
