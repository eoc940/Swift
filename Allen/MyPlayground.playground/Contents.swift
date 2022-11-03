import UIKit

struct Sprite {
    let x: Double
    let y: Double
}

class ZPlayer: ZPlayerProtocol {
    func doSomething() {
        print("dosomething")
    }
    
    let sprite: Sprite
    
    init(sprite: Sprite) {
        print("#3")
        self.sprite = sprite
    }
}

protocol ZPlayerProtocol {
    var sprite: Sprite { get }
    
    func doSomething()
}

class Player: ZPlayer {
    super
}



