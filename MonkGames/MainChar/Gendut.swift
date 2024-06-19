//
//  Kecil.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 19/06/24.
//

import Foundation
import SpriteKit

class Gendut: SKSpriteNode{
    enum PlayerAnimationType: String{
        case walk
    }
    
    private var gendutWalkTexture: [SKTexture]?
    
    init() {
        let texture = SKTexture(imageNamed: "GendutWalk_0")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.gendutWalkTexture = self.loadAnimation(atlas: "Gendut", prefix:"GendutWalk_", startAt: 0, stopAt: 5)
        self.name = "Gendut"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.character.rawValue
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func walk(){
        //Check the texture
        guard let walkTexture = gendutWalkTexture else{
            preconditionFailure("Cant find gendut texture")
        }
        
        //Run animation
        startAnimation(textures: walkTexture, speed: 0.150, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop(){
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
    }
}
