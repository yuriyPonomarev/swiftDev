//
//  Checker.swift
//  shashkiBleat
//
//  Created by Kompik on 19/07/2020.
//  Copyright © 2020 Kompik. All rights reserved.
//

import UIKit

enum SquareColour {
    case white
    case black
    case empty
}


class Square: UIPageViewController {
    
    var position = (y: 0, x: 0) // переделать в Тюпл !!!
    var colour : SquareColour = .empty
    var isQueen = false
    var isActive = false
    var isOnFight = false
    
    func move(To position : (y: Int, x: Int)) {
        self.position = position
    } 
    func cutDown(To position: (y: Int, x: Int)) {
        self.position = position
    }
    func iAmQueen() {
        self.isQueen = true
    }
    func iAmOnFight() {
        self.isOnFight = true
    }
    func changeMyActive() {
        self.isActive = !self.isActive
    }
    func die() {
        self.colour = .empty // навсегда остается в памяти, РЕШИТЬ !!!
        //delete(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
