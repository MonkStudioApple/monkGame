//
//  GameScenePhysicsDelegate.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 21/06/24.
//

import Foundation
import SpriteKit

extension GameScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let contactMask = contact.bodyA.categoryBitMask |
        contact.bodyB.categoryBitMask
        if contactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.tower{
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.tower ? contact.bodyA.node : contact.bodyB.node
            let text = SKLabelNode(text: "Press Q to activate")
            if let towerPosition = towerNode?.position{
                TextTower(at: towerPosition, text: text)
            }else{
                removeText(text: text)
                
            }
        }
//        else if contactMask == SKSpriteNode.PhysicsCategory.kecil |
//                    SKSpriteNode.PhysicsCategory.platform{
//            let platformNode = contact.bodyA.categoryBitMask ==  SKSpriteNode.PhysicsCategory.platform ? contact.bodyB.node : contact.bodyA.node
//            if let platform = platformNode?.physicsBody{
//                SKSpriteNode.PhysicsCategory.gendut.
//            }
//        }
    }
    func removeText(text: SKLabelNode){
        text.run(SKAction.sequence([SKAction.removeFromParent()]))
    }
    
    func TextTower(at towerPosition : CGPoint, text: SKLabelNode){
    text.position = towerPosition
    text.zPosition = SKSpriteNode.Layer.label.rawValue
    text.fontSize = 36
    text.color = SKColor.white.highlight(withLevel: 10)
    addChild(text)
        
    text.run(SKAction.sequence([SKAction.wait(forDuration: 0)]))
                 
    }
    
}
