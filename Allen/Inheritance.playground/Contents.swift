import UIKit

class Person {
    var id = 0
    var name = "이름"
    var email = "abc@gmail.com"
}

class Student: Person {
    
    var studentId = 0
}

class UnderGraduate: Student {
    var major = "전공"
}



class AClass { // 만약 앞에 final을 붙이면 BClass는 AClass를 상속하지 못함
    var name = "이름"
}

class BClass: AClass {
    var id = 0
}

let b = BClass()
b.id
b.name



// 재정의



 



