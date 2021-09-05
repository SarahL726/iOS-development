//
//  ViewController.swift
//  game
//
//  Created by Sarah Li on 9/4/21.
//  Copyright © 2021 Xinyue Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var number: UILabel!
    @IBAction func plusOneButton(_ sender: Any) {
        let num = Int(number.text!)
        number.text = String(num! + 1)
    }
    
}

