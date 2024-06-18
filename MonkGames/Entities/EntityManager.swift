//
//  EntityManager.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 18/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager{
    
    var entities = Set<GKEntity>()
    let scene: SKScene
    
    init(scene: SKScene){
        self.scene = scene
    }
    
    func add(_ entity: GKEntity){
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponents.self)?.node{
            scene.addChild(spriteNode)
        }
    }
    
    func remove(_ entity: GKEntity){
        if let spriteNode = entity.component(ofType: SpriteComponents.self)?.node{
            scene.removeFromParent()
        }
        entities.remove(entity)
    }
}
