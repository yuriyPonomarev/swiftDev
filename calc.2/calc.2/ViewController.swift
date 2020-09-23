//
//  ViewController.swift
//  calc.2
//
//  Created by Kompik on 28/03/2020.
//  Copyright © 2020 Kompik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation {
        case addition
        case difference
        case multiplication
        case division
        case clear
    }
    
    
    var numberFromScreen:Double = 0
    var firstNum:Double = 0
    var mathSign = false
    var secondOperationPressed = false
    var currentOperation:Operation = .clear
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var multiplicat: UIButton!
    @IBOutlet weak var difference: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var clear: UIButton!

    
    @IBAction func changeSign(_ sender: UIButton) {
        checkAfterPressedButton()
        if result.text == "" || result.text == "0" || result == nil {
            result.text = "-"
        }else {
            let changeValue = -Double(result.text!)!
            result.text = String(changeValue)
            convertDoubleToInt()
            numberFromScreen = changeValue
        }
    }
    
    @IBAction func fact(_ sender: UIButton) {
        var iterationCounter = 1
        for iterationInt in (1...Int(numberFromScreen)){
            iterationCounter *= iterationInt
        }
        result.text = String(iterationCounter)
    }
    
    @IBAction func digits(_ sender: UIButton) {
        checkAfterPressedButton()
        let resultTextIsEmpty = result.text == "" || result.text == "0" || result == nil
        if resultTextIsEmpty && sender.titleLabel?.text == "."{
            result.text = "0"
        }
        let testForForDouble = (result.text?.contains("."))!
               guard !testForForDouble || sender.titleLabel?.text != "." else {return}
        clear.setTitle("C", for: .normal)
        result.text = (result.text ?? "") + (sender.titleLabel?.text ?? "")
        if sender.titleLabel?.text != "."{
        numberFromScreen = Double(result.text ?? "")!
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        guard result.text != "" else {return}
        
        if sender.tag != 10 && sender.tag != 15 && !secondOperationPressed{
            firstNum = Double(result.text!)!
        }
        if secondOperationPressed && sender.tag != 10 && sender.tag != 15 {
            letsCounting()
        }
        goStandartColorButton()
        
        switch sender.tag {
            
        case 10:
            if sender.titleLabel?.text == "AC"{
                // AC
                firstNum = 0
                numberFromScreen = 0
                secondOperationPressed = false
                goStandartColorButton()
                result.text = "0"
                currentOperation = .clear
            }else {
                //C
            result.text = "0"
                numberFromScreen = 0
                clear.setTitle("AC", for: .normal)
            activeColorButton()
                
            }
        case 11:
            //  /
             currentOperation = .division
            activeColorButton()
            secondOperationPressed = true
        case 12:
            // x
             currentOperation = .multiplication
            activeColorButton()
            secondOperationPressed = true
        case 13:
             // -
            currentOperation = .difference
            activeColorButton()
            secondOperationPressed = true
            
        case 14:
            // +
            currentOperation = .addition
            activeColorButton()
           secondOperationPressed = true
        case 15:
            // =
            letsCounting()
            secondOperationPressed = false
            clear.setTitle("AC", for: .normal)
        default:
            break
        }
        mathSign = true
    
    }
    
    func activeColorButton() {
        switch currentOperation {
        case .addition:
            plus.setTitleColor(.orange, for: .normal)
            plus.backgroundColor = .white
        case .difference:
            difference.setTitleColor(.orange, for: .normal)
            difference.backgroundColor = .white
        case .multiplication:
            multiplicat.setTitleColor(.orange, for: .normal)
            multiplicat.backgroundColor = .white
        case .division:
            division.setTitleColor(.orange, for: .normal)
            division.backgroundColor = .white
        default:
            break
        }
    }
    
    func convertDoubleToInt() {
        let unser = result.text?.split(separator: ".")
        if unser?[1] == "0"{
            result.text = String(unser![0])
        }
    }
    
    func letsCounting(){
        switch currentOperation {
        case .addition:
            result.text = String(firstNum + numberFromScreen)
            firstNum = Double(result.text!)!
        case .difference:
            result.text = String(firstNum - numberFromScreen)
            firstNum = Double(result.text!)!
        case .multiplication:
            result.text = String(firstNum * numberFromScreen)
            firstNum = Double(result.text!)!
        case .division:
            guard numberFromScreen != 0 else {result.text = "Ошибка"; return}
            result.text = String(firstNum / numberFromScreen)
            firstNum = Double(result.text!)!
        default:
            break
        }
        let floatUnser = Float(result.text!)!
        result.text = String(floatUnser)
        convertDoubleToInt()
    }
    
    func goStandartColorButton() {
            plus.setTitleColor(.white, for: .normal)
            plus.backgroundColor = .orange
            difference.setTitleColor(.white, for: .normal)
            difference.backgroundColor = .orange
            multiplicat.setTitleColor(.white, for: .normal)
            multiplicat.backgroundColor = .orange
            division.setTitleColor(.white, for: .normal)
            division.backgroundColor = .orange
    }
    
    func checkAfterPressedButton(){
        if mathSign == true {
            result.text = ""
            mathSign = false
            goStandartColorButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear.setTitle("AC", for: .normal)
        result.text = "0"
        mathSign = true
    }


}

