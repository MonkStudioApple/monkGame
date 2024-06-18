//
//  SpriteComponents.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 18/06/24.
//

import SpriteKit
import GameplayKit

class SpriteComponents: GKComponent{
    let node: SKSpriteNode
    
    init(texture: SKTexture) {
        node = SKSpriteNode(texture: texture, color: .white, size: texture.size())
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
