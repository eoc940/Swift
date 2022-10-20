import UIKit

class SomeOtherClass {
    private var _name = "이름" // private 속성일 때는 감추기 위해 _ 네이밍을 많이 사용함
    
    var name: String {
        return _name
    }
}

let a = SomeOtherClass()
// a.name = "길동"

 
// 저장속성의 (외부에서) 쓰기를 제한하기
class SomeAnotherClass {
    private(set) var name = "이름" // 읽기 - internal , 쓰기 - private
}

// 타입의 접근 제어 수준은 (해당 타입)멤버의 접근 제어 수준에 영향을 미침
// 타입이 internal로 선언되면 내부 멤버는 internal이하(internal/fileprivate/private)로 설정됨

public class SomeFilePrivateClass {
    open var someOpen = "open"
    public var somePublic = "public"
    var someInternal = "internal"
    fileprivate var someFilePrivate = "filePrivate"
    private var somePrivate = "private"
}

let someFilePrivate = SomeFilePrivateClass()
someFilePrivate.someOpen // filePrivate
someFilePrivate.somePublic// filePrivate
someFilePrivate.someInternal// filePrivate
someFilePrivate.someFilePrivate// filePrivate
// somePublic.somePrivate -> private라 접근 불가


// 상속 관계의 접근 제어
// 상속해서 만든 서브클래스는 상위클래스보다 더 높은 접근 수준을 가질 수 없음
// 동일 모듈에서 정의한 클래스의 상위 멤버에 접근가능하면, (접근 수준 올려서) 재정의(override)도 가능
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

// 확장 접근 제어
public class SomeClass {
    private var somePrivate = "somePrivate"
}

extension SomeClass {
    func somePrivateControlFunction() {
        somePrivate = "접근가능"
    }
}


