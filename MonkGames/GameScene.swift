//
//  GameScene.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 14/06/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let gendut  = Gendut()
    let kecil   = Kecil()
    var gendutUpPressed:Bool = false
    var gendutDownPressed:Bool = false
    var gendutLeftPressed:Bool = false
    var gendutRightPressed:Bool = false
    
    var kecilUpPressed:Bool = false
    var kecilDownPressed:Bool = false
    var kecilLeftPressed:Bool = false
    var kecilRightPressed:Bool = false
    //setting platform
    var entityManager: EntityManager!
    let playableRect: CGRect
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode
        
        gendut.position = CGPoint(x: gendut.size.width - kecil.size.width, y: 1100)
        addChild(gendut)
        
        kecil.position = CGPoint(x: kecil.size.width, y: 800)
        addChild(kecil)
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
    
    func debugDrawPlayAbleArea(){
        let shape = SKShapeNode()
        let path = CGMutablePath()
        let transform = CGAffineTransform.identity
        
        path.addRect(playableRect, transform: transform)
            
        shape.path = path
        shape.strokeColor = SKColor.red
        shape.lineWidth = 4.0
        addChild(shape)
    }
}
