//
//  Player.swift
//  Slider
//
//  Created by Kim Nordin on 2020-09-06.
//  Copyright © 2020 Kim Nordin. All rights reserved.
//

import SpriteKit
import GameplayKit

class Player: SKSpriteNode {
    
    var direction: UISwipeGestureRecognizer.Direction?
    var collision: UISwipeGestureRecognizer.Direction?
    var moving: Bool = false
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    init(imageNamed: String) {
        let color = UIColor()
        let texture = SKTexture(imageNamed: imageNamed)
        let size = CGSize(width: 50, height: 50)
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
