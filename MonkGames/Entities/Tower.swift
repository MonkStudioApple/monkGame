//
//  Tower.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 18/06/24.
//

import SpriteKit
import GameplayKit

class Tower: GKEntity{
    init(imageName: String){
        super.init()
        let spriteComponent = SpriteComponents(
            texture:  SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
