//
//  SettingsViewController.swift
//  tipster
//
//  Created by Bipin Pattan on 9/6/16.
//  Copyright © 2016 Bipin Pattan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let savedPercent = loadDefaultTipPercentage()
        self.pickerView.selectRow(savedPercent, inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupData() {
        pickerData = ["18%", "20%", "22%"]
    }

    func setupUI() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }

    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selection : \(row)")
        saveDefaultTipPercentage(row)
    }
    
    func saveDefaultTipPercentage(_ percentage: Int) {
        let defaults = UserDefaults.standard
        defaults.set(percentage, forKey: "kDefaultTipPercent")
        defaults.synchronize()
    }

    func loadDefaultTipPercentage() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "kDefaultTipPercent")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
