//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by MEWO on 23.11.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //var bird2 = SKSpriteNode()
    
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    var box7 = SKSpriteNode()
    
    var gameStarted = false
    var originalPosition : CGPoint?
    
    override func didMove(to view: SKView) {
        /*
        let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: 0, y: 0)
        bird2.size = CGSize(width: self.frame.width / 10 , height: self.frame.height / 8)
        bird2.zPosition = 1
        self.addChild(bird2)
 */
        
        //Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        
        
        // BIRD
        let birdTexture = SKTexture(imageNamed: "bird")
        
        bird = childNode(withName: "bird") as! SKSpriteNode
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 8)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.15
        originalPosition = bird.position
        
        
       
        // BOXES
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let boxSize  = CGSize(width: boxTexture.size().width / 5, height: boxTexture.size().height / 5)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.3
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.3
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.3
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.3
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.3
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.affectedByGravity = true
        box6.physicsBody?.allowsRotation = true
        box6.physicsBody?.mass = 0.3
        
        box7 = childNode(withName: "box7") as! SKSpriteNode
        box7.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box7.physicsBody?.isDynamic = true
        box7.physicsBody?.affectedByGravity = true
        box7.physicsBody?.allowsRotation = true
        box7.physicsBody?.mass = 0.3
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        //kuşu uçurma işlemi
        bird.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 100))
        bird.physicsBody?.affectedByGravity = true
*/
        if gameStarted == false{
            
            if let touch = touches.first{//dokunulan ilk nokta
                
                let touchLocation = touch.location(in: self) //dokunduğumuz nokta
                let touchNodes = nodes(at: touchLocation) //dokunulan node
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes{
                        
                        if let sprite = node as? SKSpriteNode{
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
     
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false{
            
            if let touch = touches.first{ //dokunulan ilk nokta
                
                let touchLocation = touch.location(in: self) //dokunduğumuz nokta
                let touchNodes = nodes(at: touchLocation) //dokunulan node
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes{
                        if let sprite = node as? SKSpriteNode{
                            if sprite == bird {
                                
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }

    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
        
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            let touchNodes = nodes(at: touchLocation)
            
            if touchNodes.isEmpty == false {
                
                for node in touchNodes {
                    
                    if let sprite = node as? SKSpriteNode {
                        if sprite == bird {
                           
                            let dx = -(touchLocation.x - originalPosition!.x)
                            let dy = -(touchLocation.y - originalPosition!.y)
                            
                            let impulse = CGVector(dx: dx, dy: dy)
                            
                            bird.physicsBody?.applyImpulse(impulse)
                            bird.physicsBody?.affectedByGravity = true
                            
                            gameStarted = true
                            
                        }
                    }
                    
                }
                
            }
            
        }
        
        
    }
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if let birdPhysicsBody =  bird.physicsBody{
            if birdPhysicsBody.velocity.dx <= 0 && birdPhysicsBody.velocity.dy <= 0 &&
                birdPhysicsBody.angularVelocity <= 0 && gameStarted == true{
                birdPhysicsBody.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 1
                bird.position = originalPosition!
                gameStarted = false
            }
            
        }
    }
    func touchUp(atPoint pos : CGPoint) {
      
    }
    func touchDown(atPoint pos : CGPoint) {
      
    }
}
