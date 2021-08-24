//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sarah Li on 8/12/21.
//  Copyright © 2021 Xinyue Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        calculate()
        billAmountTextField.becomeFirstResponder() 
    }

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let tip1Title = String(UserDefaults.standard.object(forKey: "tip1") as! Int) + "%";
        let tip2Title = String(UserDefaults.standard.object(forKey: "tip2") as! Int) + "%";
        let tip3Title = String(UserDefaults.standard.object(forKey: "tip3") as! Int) + "%";
        tipController.setTitle(tip1Title, forSegmentAt: 0)
        tipController.setTitle(tip2Title, forSegmentAt: 1)
        tipController.setTitle(tip3Title, forSegmentAt: 2)
        calculate()
    }
    
    @IBAction func partySizeStepper(_ sender: UIStepper) {
        partySizeLabel.text = String(Int(sender.value))
        calculate()
    }
    
    @IBAction func billAmountLabel(_ sender: Any) {
        calculate()
    }
    
    func calculate() {
        let Tips: [Double] = [(UserDefaults.standard.object(forKey: "tip1") as! Double) * 0.01, (UserDefaults.standard.object(forKey: "tip2") as! Double) * 0.01, (UserDefaults.standard.object(forKey: "tip3") as! Double) * 0.01]
        let billAmount = Double(billAmountTextField.text!) ?? 0
        let partySize = Int(partySizeLabel.text!) ?? 1
        
        let tip = Double(billAmount) * Tips[tipController.selectedSegmentIndex]
        tipAmountLabel.text = String(format:"$%.2f", tip)
        
        let total = tip + billAmount
        totalAmountLabel.text = String(format:"$%.2f", total)
        
        let perPerson = total / Double(partySize)
        perPersonLabel.text = String(format:"$%.2f", perPerson)
    }
    
    
}



