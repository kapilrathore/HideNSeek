//
//  Player.swift
//  HideNSeek
//
//  Created by Kapil Rathore on 15/03/18.
//  Copyright © 2018 Kapil Rathore. All rights reserved.
//

import Foundation
import CoreGraphics

struct MovementController {
    
    var playArea: CGRect
    var gridSize: CGFloat
    
    var playerPosition: CGRect = CGRect()
    
    var moveAmount: CGFloat {
        return playArea.size.width/gridSize
    }
    
    enum Direction: Int {
        case up = 0
        case down
        case left
        case right
    }
    
    init(playArea: CGRect, gridSize: CGFloat) {
        self.playArea = playArea
        self.gridSize = gridSize
    }
    
    func isMovementAllowed(_ direction: Direction) -> Bool {
        switch direction {
        case .up:
            return (playArea.contains(CGPoint(x:  playerPosition.midX, y: playerPosition.midY - moveAmount)))
        case .down  :
            return (playArea.contains(CGPoint(x: playerPosition.midX, y: playerPosition.midY + moveAmount)))
        case .left  :
            return (playArea.contains(CGPoint(x: playerPosition.midX - moveAmount, y: playerPosition.midY)))
        case .right :
            return (playArea.contains(CGPoint(x: playerPosition.midX + moveAmount, y: playerPosition.midY)))
        }
    }
}
