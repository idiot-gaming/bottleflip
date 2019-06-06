//
//  Button.swift
//  BottleFlip
//
//  Created by Bryan Van Horn on 6/5/19.
//  Copyright © 2019 Bryan Van Horn. All rights reserved.
//
import Foundation
import SpriteKit

protocol ButtonDelegate: class {
    func buttonClicked(button: Button)
}

class Button: SKSpriteNode {
    enum TouchType: Int {
        case down, up
    }
    
    weak var delegate: ButtonDelegate!
    private var type: TouchType = .down
    
    init(texture: SKTexture, type: TouchType) {
        var size = texture.size()
        super.init(texture: texture, color: .clear, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isPaused = true
        
        if type == .down {
            self.delegate.buttonClicked(button: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch? {
            let location = touch.location(in: parent!)
            
            if(!frame.contains(location)) {
                isPaused = false
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isPaused else {return}
        
        if type == .up {
            self.delegate.buttonClicked(button: self)
        }
        
        isPaused = false
    }
}
