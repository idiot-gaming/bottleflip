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
    
    override func didMove(to view: SKView) {
        print("Game Scene")
        setUpHUD()
        setUpBackground()
        setUpLevel()
        setUpBottle()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    private func setUpHUD() {
        
    }
    
    private func setUpBackground() {
        
    }
    
    private func setUpLevel() {
        
    }
    
    private func setUpBottle() {
        
    }
}
