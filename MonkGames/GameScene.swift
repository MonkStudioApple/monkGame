import SpriteKit
import GameController
import Carbon

class GameScene: SKScene {

    let menuScene = MenuScene()
    
    let gendut = Gendut()
    let kecil = Kecil()
    
    var gendutUpPressed:Bool = false
    var gendutDownPressed:Bool = false
    var gendutLeftPressed:Bool = false
    var gendutRightPressed:Bool = false
    
    var kecilUpPressed:Bool = false
    var kecilDownPressed:Bool = false
    var kecilLeftPressed:Bool = false
    var kecilRightPressed:Bool = false
    
    let backgroundImage = SKSpriteNode(imageNamed: "cave-background1x")
    let foregroundImage = SKSpriteNode(imageNamed: "cave-foreground1x")

    var connectedControllers: [GCController] = []
    var playerControllers: [Int: GCController] = [:]
    let maximumControllerCount = 2
    
    
    
    
    override func didMove(to view: SKView) {
        backgroundImage.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundImage.scale(to: CGSize(width: 2880, height: 1864))
        backgroundImage.zPosition = -1

        foregroundImage.position = CGPoint(x: frame.midX, y: 495)
        foregroundImage.scale(to: CGSize(width: 2880, height: frame.size.height/2))
        foregroundImage.zPosition = 1
        
        addChild(backgroundImage)
        addChild(foregroundImage)
        
        gendut.position = CGPoint(x: gendut.size.width - kecil.size.width, y: 450)
        addChild(gendut)
        
        kecil.position = CGPoint(x: kecil.size.width - kecil.size.width/2, y: 650)
        addChild(kecil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didConnectController(_:)), name: NSNotification.Name.GCControllerDidConnect, object: nil)
    }
    
    
    @objc func didConnectController(_ notification: Notification) {
        guard connectedControllers.count < maximumControllerCount else { return }
        if let controller = notification.object as? GCController {
            connectedControllers.append(controller)
            if playerControllers[0] == nil {
                playerControllers[0] = controller
                print("Controller connected and assigned to Player 1 (Gendut).")
                setupGamepadInputGendut(for: controller)
                
            } else if playerControllers[1] == nil {
                playerControllers[1] = controller
                print("Controller connected and assigned to Player 2 (Kecil). ")
                setupGamepadInputKecil(for: controller)
            }
        }
    }
    
    func setupGamepadInputGendut(for controller: GCController) {
        if let extendedGamepad = controller.extendedGamepad {
            let handlerInstance = Handler()
            extendedGamepad.buttonMenu.valueChangedHandler = handlerInstance.buttonMenuValueChangedHandler
            extendedGamepad.buttonX.valueChangedHandler = handlerInstance.buttonXValueChangedHandler
            extendedGamepad.leftThumbstick.valueChangedHandler = { (thumbstick, xValue, yValue) in
                if controller == self.playerControllers[0] {
                    if xValue < -0.5 {
                        self.gendutLeftPressed = true
                    } else if xValue > 0.5 {
                        self.gendutRightPressed = true
                    } else {
                        self.gendutLeftPressed = false
                        self.gendutRightPressed = false
                    }
                    
                    if yValue < -0.5 {
                        self.gendutDownPressed = true
                    } else if yValue > 0.5{
                        self.gendutUpPressed = true
                    } else {
                        self.gendutDownPressed = false
                        self.gendutUpPressed = false
                    }
                    self.gendut.stop()
                }
            }
        }
    }


    
    func setupGamepadInputKecil(for controller: GCController) {

        if let extendedGamepad = controller.extendedGamepad {
            let handlerInstance = Handler()
            extendedGamepad.buttonMenu.valueChangedHandler = handlerInstance.buttonMenuValueChangedHandler
            extendedGamepad.buttonX.valueChangedHandler = handlerInstance.buttonXValueChangedHandler
            extendedGamepad.leftThumbstick.valueChangedHandler = { (thumbstick, xValue, yValue) in
                if controller == self.playerControllers[1] {
                    if xValue < -0.5 {
                        self.kecilRightPressed = true
                    } else if xValue > 0.5 {
                        self.kecilLeftPressed = true
                    } else {
                        self.kecilLeftPressed = false
                        self.kecilRightPressed = false
     
                    }
                    if yValue < -0.5 {
                        self.kecilDownPressed = true
                    } else if yValue > 0.5 {
                        self.kecilUpPressed = true
                    } else {
                        self.kecilDownPressed = false
                        self.kecilUpPressed = false
                    }
                    self.kecil.stop()
                
                }
                
            }
        }
    }
    
    override func keyDown(with event: NSEvent) {
        switch Int(event.keyCode) {
            case kVK_ANSI_W:
                gendutUpPressed = true
            case kVK_ANSI_A:
                gendutLeftPressed = true
            case kVK_ANSI_S:
                gendutDownPressed = true
            case kVK_ANSI_D:
                gendutRightPressed = true
            case kVK_UpArrow:
                kecilUpPressed = true
            case kVK_DownArrow:
                kecilDownPressed = true
            case kVK_LeftArrow:
                kecilRightPressed = true
            case kVK_RightArrow:
                kecilLeftPressed = true
            default:
                break
        }
        
        
        if let controller = playerControllers[0] {
            if let extendedGamepad = controller.extendedGamepad {
                let thumbstick = extendedGamepad.leftThumbstick
                if thumbstick.xAxis.value < -0.5 {
                    gendutLeftPressed = true
                } else if thumbstick.xAxis.value > 0.5 {
                    gendutRightPressed = true
                }
                if thumbstick.yAxis.value < -0.5 {
                    gendutDownPressed = true
                } else if thumbstick.yAxis.value > 0.5 {
                    gendutUpPressed = true
                }
            }
        }
    }
    
    override func keyUp(with event: NSEvent) {
        switch Int(event.keyCode) {
        case kVK_ANSI_W:
            gendutUpPressed = false
            gendut.stop()
        case kVK_ANSI_A:
            gendutLeftPressed = false
            gendut.stop()
        case kVK_ANSI_S:
            gendutDownPressed = false
            gendut.stop()
        case kVK_ANSI_D:
            gendutRightPressed = false
            gendut.stop()
        case kVK_UpArrow:
            kecilUpPressed = false
            kecil.stop()
        case kVK_DownArrow:
            kecilDownPressed = false
            kecil.stop()
        case kVK_LeftArrow:
            kecilRightPressed = false
            kecil.stop()
        case kVK_RightArrow:
            kecilLeftPressed = false
            kecil.stop()
        default:
            break
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        //Gendut
        //Case up-down
        if gendutUpPressed == true {
            gendut.position.y += 2.5
            gendut.walk()
        } else if gendutDownPressed == true {
            gendut.position.y -= 2.5
            gendut.walk()
        }
        
        //Case left-right
        if gendutLeftPressed == true {
            gendut.position.x -= 2.5
            gendut.xScale = -1
            gendut.walk()
        } else if gendutRightPressed == true {
            gendut.position.x += 2.5
            gendut.xScale = 1
            gendut.walk()
        }
        
        //Kecil
        //Case up-down
        if kecilUpPressed == true {
            kecil.position.y += 5
            kecil.walk()
        } else if kecilDownPressed == true {
            kecil.position.y -= 5
            kecil.walk()
        }
        
        //Case left-right
        if kecilLeftPressed == true {
            kecil.position.x += 5
            kecil.xScale = 1
            kecil.walk()
        } else if kecilRightPressed == true {
            kecil.position.x -= 5
            kecil.xScale = -1
            kecil.walk()
        }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
