//
//  GameScene.swift
//  BottleFlip
//
//  Created by Bryan Van Horn on 6/4/19.
//  Copyright © 2019 Bryan Van Horn. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var menuOptions: MenuOptions!
    var target: SKSpriteNode!
    var bottle: SKSpriteNode!
    var dragStart: CGPoint?
    var touchInterval: TimeInterval!
    
    override func didMove(to view: SKView) {
        print("Game Scene")
        setUpHUD()
        setUpBackground()
        setUpLevel()
        setUpBottle()
        
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeR))
//        swipeRight.direction = .right
//        view.addGestureRecognizer(swipeRight)
        
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanFrom))
//        view.addGestureRecognizer(panGestureRecognizer)
    }
    
//    @objc func swipeR(sender: UISwipeGestureRecognizer) {
//        // Handle swipe right
//        print("Swipe right")
//    }
//    @objc func handlePanFrom(_ recognizer: UIPanGestureRecognizer){
//        // Handle pan
//        print("Just panned")
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard dragStart == nil else {return}
        
        for touch in touches {
            let location = touch.location(in: self)
            if(bottle.contains(location)){
                print("grabbed bottle")
                dragStart = location
                touchInterval = touch.timestamp
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let start = dragStart else {return}
        let end = touches.first!.location(in: self)
        let endTime = touches.first!.timestamp
        touchInterval = endTime - touchInterval
        flip(from: start, to: end, time: touchInterval)
        dragStart = nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    private func flip(from: CGPoint, to: CGPoint, time: TimeInterval){
//        print(to.x - from.x)
//        print(to.y - from.y)
//        print(1/time)
        
        print(bottle.position.x)
        print(bottle.position.y)
        
        let cgTime = CGFloat(1/time)
        
        let flipVector = CGVector(dx: (to.x - from.x) * cgTime, dy: (to.y - from.y) * cgTime)
        
        // bottle.physicsBody?.applyForce(flipVector, at: CGPoint(x: bottle.position.x, y: bottle.position.y - 10))
        
        bottle.physicsBody?.applyTorque(20)
        
        var x = bottle.position.x
        var y = bottle.position.y
        
        // If bottle is moving, disable user interaction with it
        // Don't let users flip the bottle more than once
        while(bottle.position.x != x && bottle.position.y != y){
            bottle.isUserInteractionEnabled = false
            x = bottle.position.x
            y = bottle.position.y
        }
    }
    
    private func setUpHUD() {
        
    }
    
    private func setUpBackground() {
        let background = SKSpriteNode(imageNamed: ImageName.Background)
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = Layer.Background
//        background.size = CGSize(width: size.width, height: size.height)
//        self.addChild(background)
        self.backgroundColor = SKColor.white
    }
    
    private func setUpLevel() {
        
    }
    
    private func setUpBottle() {
        bottle = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 60, height: 150))
        bottle.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bottle.zPosition = Layer.Bottle
        bottle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottle.size.width, height: bottle.size.height))
        bottle.physicsBody?.affectedByGravity = false
        self.addChild(bottle)
    }
}
