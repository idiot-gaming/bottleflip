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
    var currentLevel: SKLabelNode!
    var bestScore: SKLabelNode!
    var pauseButton: SKSpriteNode!
    var helpButton: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        print("Game Scene")
        initializeGameView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    private func initializeGameView() {
        currentLevel = SKLabelNode(fontNamed: "")
        bestScore = SKLabelNode(fontNamed: "")
        pauseButton = SKSpriteNode(color: SKColor.orange, size: CGSize(width: 50, height: 50))
        helpButton = SKSpriteNode(color: SKColor.cyan, size: CGSize(width: 50, height: 50))
        
        
    }
}
