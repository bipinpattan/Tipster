//
//  ViewController.swift
//  tipster
//
//  Created by Bipin Pattan on 9/6/16.
//  Copyright © 2016 Bipin Pattan. All rights reserved.
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
        setupUI()
        doTipCalculations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        doTipCalculations()
    }

    func setupUI() {
        self.billField.becomeFirstResponder()
        self.tipControl.selectedSegmentIndex = loadDefaultTipPercentage()
    }
    
    func loadDefaultTipPercentage() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "kDefaultTipPercent")
    }
    
    func doTipCalculations() {
        let tipPercentages = [0.18, 0.20, 0.22]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
    }
}

