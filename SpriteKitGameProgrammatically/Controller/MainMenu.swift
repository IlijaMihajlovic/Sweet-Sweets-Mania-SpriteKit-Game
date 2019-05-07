//
//  MainMenu.swift
//  SpriteKitGameProgrammatically
//
//  Created by Ilija Mihajlovic on 4/18/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit
import UIKit
class MainMenu: SKScene {

    var background: SKSpriteNode = {
        var sprite = SKSpriteNode(imageNamed: "Background")
        if DeviceType.isiPad || DeviceType.isiPadPro {
            sprite.scaleTo(screenWidthPercentage: 1.0)
        } else {
            sprite.scaleTo(screenHeightPercentage: 1.0)
        }
        sprite.zPosition = 0
        return sprite
    }()
    
    lazy var playButton: BDButton = {
        var button = BDButton(imageNamed: "ButtonPlay", buttonAction: {
            self.startGameplay()
            
        })
        button.scaleTo(screenWithPercentage: 0.33)
        button.zPosition = 1
        return button
    }()
    
    
    var title: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "Helvetica")
        label.fontSize = CGFloat.universalFont(size: 24)
        label.zPosition = 2
        label.color = SKColor.white
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.text = "The Biggest Donut"
        return label
    }()
    
    
    
    lazy var shareButton: BDButton = {
        var button = BDButton(imageNamed: "ButtonShare", buttonAction: {
            
            ACTManager.shared.share(on: self, text: "I just love this new game. Go ahead and download 'The Biggest Donut' from the App Store", image: UIImage(named: "Donut92"), exculdeActivityTypes: [])
            
        })
        button.scaleTo(screenWithPercentage: 0.27)
        button.zPosition = 1
        return button
    }()
    
    
    
    lazy var handleMoreButton: BDButton = {
        var button = BDButton(imageNamed: "ButtonSettings", buttonAction: {
        self.handleMore()
          
        })
        button.scaleTo(screenWithPercentage: 0.27)
        
        button.zPosition = 2
        return button
    }()
    
    

    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        playButton.position = CGPoint.zero
        setupNodes()
        addNodes()
 
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.mainMenu = self //Make Main Menu scene not nil
        return launcher
    }()

    
    func handleMore() {
        settingsLauncher.mainMenu = self
        settingsLauncher.showSettings()
 
    }

    func setupNodes() {
        background.position = CGPoint.zero
        title.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.25)
        playButton.position = CGPoint.zero
        shareButton.position = CGPoint(x: ScreenSize.width * 0.20, y: ScreenSize.heigth * -0.15)
        handleMoreButton.position = CGPoint(x: ScreenSize.width * 0.30, y: ScreenSize.heigth * 0.35)
    }
    
    
    func addNodes() {
        addChild(background)
        addChild(title)
        addChild(playButton)
        addChild(shareButton)
        addChild(handleMoreButton)
    }
    
    @objc func startGameplayNotification(_ info:Notification) {
        startGameplay()
    }
    
    func startGameplay() {
        ACTManager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .right, duration: 0.5))
        
    }
}



