//
//  ViewController.swift
//  PrimeNumber
//
//  Created by Kai on 2018/8/9.
//  Copyright © 2018年 Kai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func doThePrimeTest(_ sender: UIButton) {
        // 1. Take out the number string from the input Textfield
        if let inputText = inputTextField.text, let inputNumber = Int(inputText){
            // 2. Convert the number string into int
                // 3. Using the check function to get result
                // Using the resultlabel to show result
                checkPrime(withNumber: inputNumber) {
                    self.resultLabel.text = $0
                    self.resultLabel.isHidden = false
                }
        }
        // clean the input
        inputTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // push the keyboard up  
        inputTextField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checkPrime(withNumber testNumber:Int) -> String{
        var isPrime:Bool? = true
        var test:String = ""
        if testNumber <= 0{
            isPrime = nil
        }else if testNumber == 1{
            isPrime = false
        }else{
            for i in 2..<testNumber{
                if testNumber % i == 0{
                    //testNumber is not a prime
                    isPrime = false
                    break
                }
            }
        }
        
        if isPrime == true{
            test = "\(testNumber) is a prime"
        }else if isPrime == false{
            test = "\(testNumber) is not a prime"
        }
        else{
            test = "reenter"
        }
        return test
    }
    
    // 2 parameters, one Integer and one Closure
    func checkPrime(withNumber number:Int, andCompletionHander handler:(String)->()){
        handler(checkPrime(withNumber: number))
    }


}

