//
//  ViewController.swift
//  shashkiBleat
//
//  Created by Kompik on 16/07/2020.
//  Copyright © 2020 Kompik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let boardSize = (min: 0, max: 7)
    var board : [[Square?]] = [[]]
    
    class Board: ViewController { //по возможности убрать наследование - ибо нехуй
        
        func getPossibleMoves(square: Square) -> [Square?] { // доработать логику
            var result: [Square?] = []
            guard square.colour != .empty else {return result}
            
            if(!square.isQueen){
                result = getSimpleMoves(square: square)
            } else {
                result = getQueenMoves(square: square)
            }
            return result
        }
        
//        func getSimpleMoves(square: Square) -> [Square?] {
//            let yMoveDirection = square.colour == .white ? 1 : -1
//            var result: [Square?] = []
//
//            guard square.position.y != boardSize.max else {return []}
//            if square.position.x > boardSize.min && square.position.x < boardSize.max {
//                if board[square.position.y+yMoveDirection][square.position.x+1]?.colour == .empty {
//                    result.append(board[square.position.y+yMoveDirection][square.position.x+1])
//                } else if board[square.position.y+yMoveDirection][square.position.x-1]?.colour == .empty {
//                        result.append(board[square.position.y+yMoveDirection][square.position.x-1])
//                }
//            } else if square.position.x == boardSize.min {
//                if board[square.position.y+yMoveDirection][square.position.x+1]?.colour == .empty {
//                    result.append(board[square.position.y+yMoveDirection][square.position.x+1])
//                }
//            } else if square.position.x == boardSize.max {
//                if board[square.position.y+yMoveDirection][square.position.x-1]?.colour == .empty {
//                   result.append(board[square.position.y+yMoveDirection][square.position.x-1])
//                }
//            }
//            return result
//        }
        
        func getSimpleMoves(square: Square) -> [Square?]{
            let yMoveDirection = square.colour == .white ? 1 : -1
            var result: [Square?] = []
            
            let forwardLeftSquare = checkSquare(x: square.position.x - 1, y: square.position.y + yMoveDirection)
            result.append(forwardLeftSquare)
            let forwardRightSquare = checkSquare(x: square.position.x + 1, y: square.position.y + yMoveDirection)
            result.append(forwardRightSquare)
         //   let backLeftSquare = checkSquare(x: square.position.x - 1, y: square.position.y - yMoveDirection)
         //   result.append(backLeftSquare)
         //   let backRightSquare = checkSquare(x: square.position.x + 1, y: square.position.y - yMoveDirection)
          //  result.append(backRightSquare)
            
            for i in result.enumerated() {
                if(i.element?.colour == SquareColour.empty){
                    continue
                }
                if(i.element?.colour == square.colour){
                    result.remove(at: i.offset)
                } else {
                    result.append(checkAttackMove(originalSquare: square, chekedSquare: i.element))
                }
            }
            
           // return result.filter{$0 != backLeftSquare || $0 != backRightSquare}
        }
        
        func getCutDownMoves(square: Square) -> [Square?] {
            
        }
        
        func checkAttackMove(originalSquare: Square, chekedSquare: Square?) -> Square? {
            var result: Square? = nil
            if(chekedSquare != nil && originalSquare.colour != chekedSquare?.colour){
                var shiftX = (chekedSquare?.position.x)! - originalSquare.position.x
                var shiftY = (chekedSquare?.position.y)! - originalSquare.position.y
            }
            
            return result
        }
        
        func checkSquare(x: Int, y: Int) -> Square? {
            var result: Square? = nil
            if boardSize.min <= x && x <= boardSize.max &&
                boardSize.min <= y && y <= boardSize.max{
                result = board[y][x]
            }
            return result
        }
        
        func getQueenMoves(square: Square) -> [Square?] { // добавить логику
           
            return []
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...32 {
            
        }
        // Do any additional setup after loading the view.
    }


}

