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
    @IBOutlet weak var twoFirends: UILabel!
    @IBOutlet weak var threeFirends: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    var currencyDict = ["en_US","de_DE","cy_GB"]
    var placeHolder = ["$","€","£"]
    var currentCurrency : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey:"selectedSegment")
        tipControl.selectedSegmentIndex = intValue
        currentCurrency = defaults.integer(forKey: "currencySegment")
        billField.placeholder = placeHolder[currentCurrency]
        calculateTip(self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
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
        
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: currencyDict[currentCurrency])


        tipLabel.text = "\(numberFormatter.string(from: NSNumber(value: tip))!)"
        totalLabel.text = "\(numberFormatter.string(from: NSNumber(value: total))!)"
        twoFirends.text = "\(numberFormatter.string(from: NSNumber(value: total/2))!)"
        threeFirends.text = "\(numberFormatter.string(from: NSNumber(value: total/3))!)"
        
        
    }

}
