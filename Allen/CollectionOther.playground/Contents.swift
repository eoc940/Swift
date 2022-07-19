import UIKit

// KeyValuePairs
// 딕셔너리와 유사하지만 순서가 있음

let introduce: KeyValuePairs = ["first": "Hello", "second": "My Name", "third": "is"]

// 기본 기능
introduce.count
introduce.isEmpty

// 요소에 접근
introduce[2].1 // 튜플 방식으로 접근

introduce[0].key
introduce[0].value

var array = [1,2,3,4,5,6,7]

var subArray = array[0...2]




