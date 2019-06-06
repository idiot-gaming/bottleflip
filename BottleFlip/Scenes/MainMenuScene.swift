//
//  MainMenuScene.swift
//  BottleFlip
//
//  Created by Bryan Van Horn on 6/4/19.
//  Copyright © 2019 Bryan Van Horn. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenuScene: SKScene {
    var gameLogo: SKLabelNode!
    var playButton: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        print("Main Menu Scene")
        initializeMainMenu()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if(playButton.contains(location)){
                // print("tapped")
                self.startGame()
            }
        }
    }
    
    private func initializeMainMenu() {
        gameLogo = SKLabelNode(fontNamed: "ArialRoundedMTBold")
        playButton = SKSpriteNode(color: SKColor.green, size: CGSize(width: 100, height: 100))
        
        gameLogo.text = "Game Logo Here"
        gameLogo.fontColor = SKColor.white
        gameLogo.position = CGPoint(x: 0, y: (self.frame.size.height / 2) - 200)
        self.addChild(gameLogo)
        
        playButton.position = CGPoint(x: 0, y: gameLogo.position.y - 500)
        self.addChild(playButton)
    }
    
    private func startGame() {
        let gameScene = GameScene(size: view!.bounds.size)
        let transition = SKTransition.fade(withDuration: 1)
        view!.presentScene(gameScene, transition: transition)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
