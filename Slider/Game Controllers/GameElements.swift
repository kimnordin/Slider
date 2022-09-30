//
//  GameElements.swift
//  Slider
//
//  Created by Kim Nordin on 2020-09-06.
//  Copyright © 2020 Kim Nordin. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene {
    func addPlayer() {
        player.anchorPoint = CGPoint(x: 0, y: 0)
        player.position = CGPoint(x: 50, y: 300)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.linearDamping = 0
        player.physicsBody?.categoryBitMask = playerCategory
        player.physicsBody?.contactTestBitMask = wallCategory | blockCategory
        self.addChild(player)
    }
    
    func addBlock(xPos: CGFloat, yPos: CGFloat, color: UIColor? = nil) {
        let block = Block(color: color ?? .yellow, size: CGSize(width: 50, height: 50))
        block.anchorPoint = CGPoint(x: 0, y: 0)
        block.position = CGPoint(x: xPos, y: yPos)
        block.physicsBody = SKPhysicsBody(rectangleOf: block.size)
        block.physicsBody?.isDynamic = false
        block.physicsBody?.categoryBitMask = blockCategory
        block.physicsBody?.restitution = 0
        self.addChild(block)
    }
    
    func addBlocks() {
        for q in 2...8 {
            addBlock(xPos: CGFloat(q*50), yPos: 150, color: q == 2 ? .systemPink : .yellow)
        }
        addBlock(xPos: 50, yPos: 350)
        addBlock(xPos: 0, yPos: 450)
        addBlock(xPos: 500, yPos: 300)
        addBlock(xPos: 150, yPos: 300, color: .blue)
        addBlock(xPos: 150, yPos: 350)
        addBlock(xPos: 150, yPos: 250)
        addBlock(xPos: 300, yPos: 0)
        addBlock(xPos: 350, yPos: 100, color: .purple)
        addBlock(xPos: 0, yPos: 450)
        addBlock(xPos: 100, yPos: 450)
        addBlock(xPos: 350, yPos: 450)
        addBlock(xPos: 600, yPos: 50)
        addBlock(xPos: 600, yPos: 100)
        addBlock(xPos: 550, yPos: 0)
        addBlock(xPos: 550, yPos: 250)
        addBlock(xPos: 600, yPos: 200)
        addBlock(xPos: 50, yPos: 50)
    }
    
    func addWalls() {
        let rightWall = Wall(color: .yellow, direction: .right)
        rightWall.position = CGPoint(x: 741, y: 207)
        let leftWall = Wall(color: .yellow, direction: .left)
        leftWall.position = CGPoint(x: -5, y: 207)
        let upWall = Wall(color: .yellow, direction: .up)
        upWall.position = CGPoint(x: 368, y: 419)
        let downWall = Wall(color: .yellow, direction: .down)
        downWall.position = CGPoint(x: 368, y: -5)
        
        walls.append(contentsOf: [rightWall, leftWall, upWall, downWall])
        
        for wall in walls {
            self.addChild(wall)
            wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
            wall.physicsBody?.isDynamic = false
            wall.physicsBody?.categoryBitMask = wallCategory
            wall.physicsBody?.restitution = 0
        }
    }
    
    func addActions() {
        let swipeRight = UISwipeGestureRecognizer(target: self,
            action: #selector(GameScene.swipeRight(sender:)))
        swipeRight.direction = .right
        view?.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: self,
            action: #selector(GameScene.swipeLeft(sender:)))
        swipeLeft.direction = .left
        view?.addGestureRecognizer(swipeLeft)
        let swipeUp = UISwipeGestureRecognizer(target: self,
            action: #selector(GameScene.swipeUp(sender:)))
        swipeUp.direction = .up
        view?.addGestureRecognizer(swipeUp)
        let swipeDown = UISwipeGestureRecognizer(target: self,
            action: #selector(GameScene.swipeDown(sender:)))
        swipeDown.direction = .down
        view?.addGestureRecognizer(swipeDown)
    }
}
