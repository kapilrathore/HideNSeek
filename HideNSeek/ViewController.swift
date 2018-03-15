//
//  ViewController.swift
//  HideNSeek
//
//  Created by Kapil Rathore on 15/03/18.
//  Copyright © 2018 Kapil Rathore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var movementController: MovementController! {
        didSet {
            player.frame.size = CGSize(width: movementController.moveAmount, height: movementController.moveAmount)
        }
    }
    
    @IBOutlet var  movementButtons: [UIButton]!
    @IBOutlet weak var playArea: UIView!
    @IBOutlet weak var player: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movementController = MovementController(playArea: playArea.frame, gridSize: 5)
        movementController.playerPosition = player.frame
    }
    
    @IBAction func movePlayer(_ sender: UIButton) {
        if let move = movementButtons.index(of: sender) {
            moveToDirection(MovementController.Direction(rawValue: move)!)
        }
    }
    
    func moveToDirection(_ direction: MovementController.Direction) {

        guard movementController.isMovementAllowed(direction) else {
            displayMessage("❌❌❌❌❌")
            return
        }

        UIView.animate(withDuration: 0.3, animations: {
            switch direction {
            
            case .up    :
                self.player.frame.origin.y -= self.movementController.moveAmount
                self.movementController.playerPosition.origin.y -= self.movementController.moveAmount
                
            case .down  :
                self.player.frame.origin.y += self.movementController.moveAmount
                self.movementController.playerPosition.origin.y += self.movementController.moveAmount
                
            case .left  :
                self.player.frame.origin.x -= self.movementController.moveAmount
                self.movementController.playerPosition.origin.x -= self.movementController.moveAmount
                
            case .right :
                self.player.frame.origin.x += self.movementController.moveAmount
                self.movementController.playerPosition.origin.x += self.movementController.moveAmount
            }
        })
    }
    
    func displayMessage(_ message: String) {
        messageLabel.text = message
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.messageLabel.text = ""
        }
    }
}