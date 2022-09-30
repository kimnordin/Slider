//
//  GameFunctions.swift
//  Slider
//
//  Created by Kim Nordin on 2020-09-06.
//  Copyright © 2020 Kim Nordin. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene {
    // Handle the swipe
    func movePlayer(direction: UISwipeGestureRecognizer.Direction) {
        if direction != player.collision {
            if player.moving == false {
                player.moving = true
                player.direction = direction
                switch direction {
                case .right:
                    let moveRightAction = SKAction.move(by: CGVector(dx: 1, dy: 0), duration: 0.005)
                    let repeatAction = SKAction.repeatForever(moveRightAction)
                    player.run(repeatAction)
                case .left:
                    let moveLeftAction = SKAction.move(by: CGVector(dx: -1, dy: 0), duration: 0.005)
                    let repeatAction = SKAction.repeatForever(moveLeftAction)
                    player.run(repeatAction)
                case .up:
                    let moveUpAction = SKAction.move(by: CGVector(dx: 0, dy: 1), duration: 0.005)
                    let repeatAction = SKAction.repeatForever(moveUpAction)
                    player.run(repeatAction)
                case .down:
                    let moveDownAction = SKAction.move(by: CGVector(dx: 0, dy: -1), duration: 0.005)
                    let repeatAction = SKAction.repeatForever(moveDownAction)
                    player.run(repeatAction)
                default: return
                }
            }
        }
    }
    
    @objc func moveToStart(contact: SKPhysicsContact) {
        movePlayerToStart()
    }
    
    @objc func swipeRight(sender: UISwipeGestureRecognizer) {
        movePlayer(direction: .right)
    }
    @objc func swipeLeft(sender: UISwipeGestureRecognizer) {
        movePlayer(direction: .left)
    }
    @objc func swipeUp(sender: UISwipeGestureRecognizer) {
        movePlayer(direction: .up)
    }
    @objc func swipeDown(sender: UISwipeGestureRecognizer) {
        movePlayer(direction: .down)
    }
    
    func movePlayerToStart() {
        player.collision = nil
        player.direction = nil
        player.moving = false
        player.removeAllActions()
        player.removeFromParent()
        addPlayer()
    }
    
    func nextLevel(playerPhysicsBody: SKPhysicsBody) {
        let emitter = SKEmitterNode(fileNamed: "fireworks.sks")
        playerPhysicsBody.node?.addChild(emitter!)
        
        self.run(SKAction.wait(forDuration: 0.5)) {
            emitter?.removeFromParent()
            self.movePlayerToStart()
        }
    }
}
