//
//  GameScene.swift
//  Test34-S19
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 rabbit. All rights reserved.
//

import SpriteKit
import GameplayKit

class Level2: SKScene {
    
    var nextLevelButton:SKLabelNode!
    
    
    override func didMove(to view: SKView) {
        print("Loaded level 2")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    var mouseStratingPosition:CGPoint = CGPoint(x:0,y:0)
    
    //this function gets the posisiton of tap down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        //getting the mouse position on tap down
        let mousePosition = touches.first?.location(in: self)
        
        //checking the x position
        print(mousePosition!.x)
        
        //make orange only when user clicks on tree
        
        //first check on what sprite the use clicks
        let spriteTouched = self.atPoint(mousePosition!)
        
        //now check if the touched sprite is tree
        if(spriteTouched.name == "tree")
        {
            //getting the initial mouse position only when person taps the tree
            self.mouseStratingPosition = mousePosition!
        }
        else{
            self.mouseStratingPosition = CGPoint(x:0,y:0)
        }
        
    }
    
    //getting the mouse position on tap release
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //getting the mouse position on tap release
        let mousePosition = touches.first?.location(in: self)
        
        if(self.mouseStratingPosition.x != 0 && self.mouseStratingPosition.y != 0)
        {
            //gettin difference between strating and ending
            let diffX = mousePosition!.x - mouseStratingPosition.x
            let diffY = mousePosition!.y - mouseStratingPosition.y
            
            //make orange at mouse position and throw it in correct direction
            
         
            
        }}

}
