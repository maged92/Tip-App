//
//  ViewController.swift
//  tipApp
//
//  Created by Maged Kasem on 2/24/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey:"selectedSegment")
        tipControl.selectedSegmentIndex = intValue

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }


    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercantages = [0.15,0.20,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercantages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}
