//
//  GameScene.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 14/06/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //setting platform
    var entityManager: EntityManager!
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self)
        let theTower1 = Tower(imageName: "")
        if let spriteComponent = theTower1.component(ofType: SpriteComponents.self){
            spriteComponent.node.position = CGPoint(x: spriteComponent.node.size.width/2, y: size.width/4*3)
        }
        entityManager.add(theTower1)
        
        let theTower2 = Tower(imageName: "")
        if let spriteComponent = theTower2.component(ofType:  SpriteComponents.self){
            spriteComponent.node.position = CGPoint(x: spriteComponent.node.size.width/4, y: size.width/4)
        }
        entityManager.add(theTower2)
        
        let theTower3 = Tower(imageName: "")
        if let spriteComponent = theTower3.component(ofType: SpriteComponents.self){
            spriteComponent.node.position = CGPoint(x: size.width-spriteComponent.node.size.width/2, y: size.width/4*3)
        }
        entityManager.add(theTower3)
        
        let theTower4 = Tower(imageName: "")
        if let spriteComponent = theTower4.component(ofType: SpriteComponents.self){
            spriteComponent.node.position = CGPoint(x: spriteComponent.node.size.width/4, y: size.width/4)
        }
        entityManager.add(theTower4)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    
    }
    
    func touchUp(atPoint pos : CGPoint) {
    
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
