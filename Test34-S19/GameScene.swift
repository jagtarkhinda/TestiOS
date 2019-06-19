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
    
  
    // keep track of all the lemmings
    var lemings:[SKSpriteNode] = []
    var label = SKLabelNode()
    var dir:[String] = []
    var count:Int = 0;
    var goingHome:Int = 0;
    
    var home:SKSpriteNode = SKSpriteNode(imageNamed: "home")
    
    var nextLevelButton:SKLabelNode!
    
    
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        home.position = CGPoint(x: 600,y: 432)
       home.physicsBody = SKPhysicsBody(rectangleOf: home.size)
        home.physicsBody?.affectedByGravity = false;
        home.physicsBody?.allowsRotation = false
        home.physicsBody?.isDynamic = false
        self.addChild(home)
       
    
    }
    
    //ad platform
    func addPlatform(getX:CGFloat,getY:CGFloat)
    {
         let plat: SKSpriteNode = SKSpriteNode(imageNamed: "block")
         plat.physicsBody = SKPhysicsBody(rectangleOf: plat.size)
        plat.physicsBody?.affectedByGravity = false;
        plat.physicsBody?.allowsRotation = false
        plat.physicsBody?.isDynamic = false
        
        plat.position = CGPoint(x: getX, y: getY)
        
        // add the platform to the scene
        self.addChild(plat)
        
        
    }
    
    
    //function to create leming
    func makeleming() {
        // lets add some lemings
        let lm: SKSpriteNode = SKSpriteNode(imageNamed: "mush")
        
        lm.physicsBody = SKPhysicsBody(rectangleOf: lm.size)
        lm.physicsBody?.allowsRotation = false
        lm.physicsBody?.restitution = 0.0;
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
    
    
    var timeOfLastUpdate:TimeInterval?
    var movingLeft = "false"
    
    override func update(_ currentTime: TimeInterval) {
       

        
        if (timeOfLastUpdate == nil) {
            timeOfLastUpdate = currentTime
        }
        // print a message every 3 seconds
        var timePassed = (currentTime - timeOfLastUpdate!)
        if (timePassed >= 1.5) {
          
            timeOfLastUpdate = currentTime
            // make a leming
            if(count < 5){
            self.makeleming()
                count += 1
            }
            if(count >= 5){
                if(goingHome >= 13){
                label.text = "You Win"
                label.fontColor = .white
                label.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
                label.fontSize = 29.0
                label.zPosition = 1
                }
                else if(goingHome < 13){
                    label.text = "You Lose"
                    label.fontColor = .white
                    label.verticalAlignmentMode = .center
                    label.fontSize = 29.0
                    label.zPosition = 1
                }
                    
            }
        }
        
        for (index,item) in lemings.enumerated()
        {
        if(item.intersects(home)){
            
            lemings.remove(at: index)
            item.removeFromParent()
            dir.remove(at: index)
            goingHome += 1
        }
            if(item.position.y <= 40)
            {
                lemings.remove(at: index)
                item.removeFromParent()
                dir.remove(at: index)
            }
        }
        
        for (index,item) in lemings.enumerated()
        {
         
        if((item.position.x + item.size.width) >= self.frame.width )
        {
            movingLeft = "true"
            dir.insert("true", at: index)
            
        }
        if(item.position.x  <= 50)
        {
            movingLeft = "false"
             dir.insert("false", at: index)
        }
        }
        
       for (index,item) in lemings.enumerated()
        {

            let abc:SKSpriteNode = lemings[index]
           // print(self.frame.width)


           
            if(dir[index].elementsEqual("false")){
                abc.position.x += 10
               
            }
            else if(dir[index].elementsEqual("true")){
                abc.position.x -= 10}
            
        }
        
        
    }
        
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let location = touch!.location(in:self)
        let node = self.atPoint(location)
        
        
        addPlatform(getX: location.x, getY: location.y)
        
        
        
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
