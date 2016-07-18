//
//  ViewController.swift
//  tipCalculate
//
//  Created by EricYang on 2016/7/18.
//  Copyright © 2016年 EricYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var tipPercentage: UILabel!

    @IBOutlet weak var amountAfterTax: UILabel!
    
    @IBOutlet weak var yourTip: UILabel!
    
    @IBOutlet weak var yourTotalBill: UILabel!
    
    var moneyBeforeTax:Float = 0
    var tipRatio:Float = 0.0
    
    @IBAction func amountBeforeTax(_ sender: UITextField) {
        if let input = sender.text{
            if !input.isEmpty{
                moneyBeforeTax = Float(input)!
                calculate()
            }
            else{
                moneyBeforeTax = 0
                calculate()
            }
        }
        
    }
    
    @IBAction func tipScope1(_ sender: UISlider) {
        tipRatio = sender.value
        calculate()
    }
    
    
    @IBAction func tipScope2(_ sender: UISlider) {
        tipRatio = sender.value
        calculate()
    }
    
    func calculate(){
        let tax = moneyBeforeTax * tipRatio
        let totalmoney = moneyBeforeTax + tax
        tipPercentage.text = String(Int(tipRatio*100))+"%"
        amountAfterTax.text = String(Int(totalmoney))
        yourTip.text = String(Int(tax))
        yourTotalBill.text = String(Int(totalmoney))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

