//
//  SettingsViewController.swift
//  tipApp
//
//  Created by Maged Kasem on 3/2/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey:"selectedSegment")
        defaultTipControl.selectedSegmentIndex = intValue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    @IBAction func TipController(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(self.defaultTipControl.selectedSegmentIndex, forKey: "selectedSegment")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
