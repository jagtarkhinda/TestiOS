//
//  GameScene.swift
//  Test34-S19
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 rabbit. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
   // var plat:SKSpriteNode = SKSpriteNode(imageNamed: "ground")
    // keep track of all the lemmings
    var lemings:[SKSpriteNode] = []
    
    var nextLevelButton:SKLabelNode!
    
    
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
       // self.addChild(plat)
    
    }
    //function to create leming
    func makeleming() {
        // lets add some lemings
        let lm: SKSpriteNode = SKSpriteNode(imageNamed: "mush")
        
        lm.physicsBody = SKPhysicsBody(rectangleOf: lm.size)
        //SKPhysicsBody(rectangleOf: self.leming.size)
        
        //
        //        // generate a random (x,y) for the cat
        //        let randX = Int(CGFloat(arc4random_uniform(UInt32(self.size.width-400))))
        //        let randY = Int(CGFloat(arc4random_uniform(UInt32(self.size.height-400))))
        
        lm.position = CGPoint(x: 690, y: 1080)
        
        // add the cat to the scene
        self.addChild(lm)
        
        // add the cat to the cats array
        self.lemings.append(lm)
        
    }
    //..............................................
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        makeleming()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let location = touch!.location(in:self)
        let node = self.atPoint(location)
        
        
        
        
        // MARK: Switch Levels
        if (node.name == "nextLevelButton") {
            let scene = SKScene(fileNamed:"Level2")
            if (scene == nil) {
                print("Error loading level")
                return
            }
            else {
                scene!.scaleMode = .aspectFill
                view?.presentScene(scene!)
            }
        }
        
    }
}
