//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Sarah Li on 8/13/21.
//  Copyright © 2021 Xinyue Li. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Tip1: UITextField!
    @IBOutlet weak var Tip2: UITextField!
    @IBOutlet weak var Tip3: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        Tip1.text = String(UserDefaults.standard.object(forKey: "tip1") as! Int)
        Tip2.text = String(UserDefaults.standard.object(forKey: "tip2") as! Int)
        Tip3.text = String(UserDefaults.standard.object(forKey: "tip3") as! Int)
    }
    
    @IBAction func tip1(_ sender: Any) {
        let tip1 = Int(Tip1.text!)
        UserDefaults.standard.set(tip1, forKey: "tip1")
//        UserDefaults.standard.synchronize()
    }
    
    @IBAction func tip2(_ sender: Any) {
        let tip2 = Int(Tip2.text!)
        UserDefaults.standard.set(tip2, forKey: "tip2")
//        UserDefaults.standard.synchronize()
    }

    @IBAction func tip3(_ sender: Any) {
        let tip3 = Int(Tip3.text!)
        UserDefaults.standard.set(tip3, forKey: "tip3")
        UserDefaults.standard.synchronize()
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
