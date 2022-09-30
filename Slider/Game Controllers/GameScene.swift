//
//  GameScene.swift
//  Slider
//
//  Created by Kim Nordin on 2020-09-06.
//  Copyright © 2020 Kim Nordin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //MARK: Game Properties
    
    // MARK: Nodes
    var player = Player(color: .red, size: CGSize(width: 50, height: 50))
    var block = Block(color: .yellow, size: CGSize(width: 50, height: 50))
    
    // MARK: Arrays
    var levelArray: [SKSpriteNode]? = [SKSpriteNode]()
    var blocks = [Block]()
    var walls = [Wall]()
    
    // MARK: Physics
    let playerCategory: UInt32 = 0x1 << 0 //1
    let wallCategory: UInt32 = 0x1 << 1 //2
    let blockCategory: UInt32 = 0x1 << 2 //4
    
    override func didMove(to view: SKView) {
        addPlayer()
        addBlocks()
        addActions()
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var playerBody: SKPhysicsBody
        var otherBody: SKPhysicsBody

        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            playerBody = contact.bodyA
            otherBody = contact.bodyB
        }
        else {
            playerBody = contact.bodyB
            otherBody = contact.bodyA
        }

        if playerBody.categoryBitMask == playerCategory && otherBody.categoryBitMask == blockCategory {
            if let player = playerBody.node as? Player,
                let block = otherBody.node as? Block  {
                switch player.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    if player.position.y < block.position.y && player.position.x < block.position.x + 10 && player.position.x > block.position.x - 10 {
                        stopPlayer(player.direction)
                    }
                case UISwipeGestureRecognizer.Direction.down:
                    if player.position.y > block.position.y && player.position.x < block.position.x + 10 && player.position.x > block.position.x - 10 {
                        stopPlayer(player.direction)
                    }
                case UISwipeGestureRecognizer.Direction.left:
                    if player.position.x > block.position.x && player.position.y < block.position.y + 10 && player.position.y > block.position.y - 10 {
                        stopPlayer(player.direction)
                    }
                case UISwipeGestureRecognizer.Direction.right:
                    if player.position.x < block.position.x && player.position.y < block.position.y + 10 && player.position.y > block.position.y - 10 {
                        stopPlayer(player.direction)
                    }
                default: return
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if player.position.y > self.size.height-player.size.height || player.position.y < 0
        || player.position.x > self.size.width-player.size.width || player.position.x < 0 {
            print("Move to start")
            player.removeAllActions()
            movePlayerToStart()
        }
    }
    
    func stopPlayer(_ direction: UISwipeGestureRecognizer.Direction?) {
        player.collision = direction
        player.removeAllActions()
        player.moving = false
    }
}
