//
//  ViewController.swift
//  IOSLab1
//
//  Created by Дария Мухатова on 06/10/2019.
//  Copyright © 2019 Дария Мухатова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let myCalc = Calculator()
    
    
    @IBOutlet weak var myLabel: UILabel!

    @IBAction func buttonPressed(_ sender: UIButton) {
        myLabel.text = myLabel!.text! + sender.titleLabel!.text!
        myCalc.add( expr: sender.titleLabel!.text!)
    }
    
    @IBAction func cleanAll(_ sender: UIButton) {
        if myCalc.deleteAll(){
            myLabel.text = myCalc.fullExp
        } else {
             myLabel.text = myCalc.fullExp
        }
    }
    
    @IBAction func calculateAll(_ sender: UIButton) {
        myLabel.text = "=" + String(myCalc.calculate(expr: myCalc.fullExp))
    }
    
    @IBAction func cleanLast(_ sender: UIButton) {
        if myCalc.deleteLast() {
             myLabel.text = myCalc.fullExp
        }  else {
            myLabel.text = myCalc.fullExp
        }
    }
    @IBAction func operatorPressed(_ sender: UIButton) {
        myLabel.text = myLabel!.text! + sender.titleLabel!.text!
                   myCalc.add( expr: sender.titleLabel!.text!)

    }
    

    
}

