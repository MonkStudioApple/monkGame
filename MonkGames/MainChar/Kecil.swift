//
//  Kecil.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 19/06/24.
//

import Foundation
import SpriteKit

class Kecil: SKSpriteNode{
    enum PlayerAnimationType: String{
        case walk
    }
    
    private var kecilWalkTexture: [SKTexture]?
    
    init() {
        let texture = SKTexture(imageNamed: "KecilWalk_0")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.kecilWalkTexture = self.loadAnimation(atlas: "Kecil", prefix:"KecilWalk_", startAt: 0, stopAt: 5)
        self.name = "Kecil"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.character.rawValue
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func walk(){
        //Check the texture
        guard let walkTexture = kecilWalkTexture else{
            preconditionFailure("Cant find kecil texture")
        }
        
        //Run animation
        startAnimation(textures: walkTexture, speed: 0.150, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop(){
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
    }
}
