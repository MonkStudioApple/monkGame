//
//  SpriteKitHelper.swift
//  MonkGames
//
//  Created by Sena Kristiawan on 19/06/24.
//

import Foundation
import SpriteKit

extension SKSpriteNode{
    enum Layer: CGFloat{
        case background
        case platform
        case cave
        case character
    }
    
    func loadAnimation(atlas: String, prefix: String, startAt: Int, stopAt: Int) ->
    [SKTexture]{
        var textureArray = [SKTexture]()
        let textureAtlas = SKTextureAtlas(named: atlas)
        
        for i in startAt...stopAt{
            let textureName = "\(prefix)\(i)"
            let temp = textureAtlas.textureNamed(textureName)
            textureArray.append(temp)
        }
        
        return textureArray
        
    }
    
    // Start the animation using a name and a count (0 = repeat forever)
    func startAnimation(textures: [SKTexture], speed: Double, name: Strign, count:
                        Int, resize: Bool, restore: Bool){
        //Run animation only if animation key doesnt already exist
        if(action(forKey: name) == nil) {
            let animation = SKAction.animate(with: textures, timePerFrame: speed,
                                             resize: resize, restore: restore)
            if count == 0 {
                //Run animation until stop
                let repeatAction = SKAction.repeatForever(animation)
                run(repeatAction, withKey: name)
            }else if count == 1{
                run(animation, withKey: name)
            }else{
                let repeatAction = SKAction.repeat(animation, count:count)
                run(repeatAction,withKey: name)
            }
        }
    }
}
