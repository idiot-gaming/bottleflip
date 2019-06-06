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
    
    override func didMove(to view: SKView) {
        print("Game Scene")
        setUpHUD()
        setUpBackground()
        setUpLevel()
        setUpBottle()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if(bottle.contains(location)){
                print("grabbed bottle")
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    private func setUpHUD() {
        
    }
    
    private func setUpBackground() {
//        let background = SKSpriteNode(imageNamed: ImageName.Background)
//        background.anchorPoint = CGPoint(x: 0, y: 0)
//        background.position = CGPoint(x: 0, y: 0)
//        background.zPosition = Layer.Background
//        background.size = CGSize(width: size.width, height: size.height)
//        self.addChild(background)
        self.backgroundColor = SKColor.white
    }
    
    private func setUpLevel() {
        
    }
    
    private func setUpBottle() {
        bottle = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 20, height: 50))
        bottle.position = CGPoint(x: 500, y: 500)
        bottle.zPosition = Layer.Bottle
        // bottle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottle.size.width, height: bottle.size.height))
        self.addChild(bottle)
    }
}
