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
        
        // Physics
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height/3), center: CGPoint(x: 0, y: self.size.height/3))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.gendut
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.tower | SKSpriteNode.PhysicsCategory.platform
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
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
