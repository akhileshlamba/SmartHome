//
//  SettingsViewController.swift
//  SmartHome
//
//  Created by Parth on 4/11/18.
//  Copyright © 2018 Akhilesh Lamba. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var airConditionLowerTemp : Int?
    var heaterUpperTemp: Int?
    
    @IBOutlet weak var airConditionerLowerTemperature: UITextField!
    @IBOutlet weak var heaterUpperTemperature: UITextField!

    @IBAction func saveConfigButton(_ sender: Any) {
        
        if(airConditionerLowerTemperature.text != "" && heaterUpperTemperature.text != ""){
            UserDefaults.standard.set(Int(airConditionerLowerTemperature.text!), forKey: "airConditionLowerTemp")
            UserDefaults.standard.set(Int(heaterUpperTemperature.text!), forKey: "heaterUpperTemp")
            airConditionLowerTemp = Int(airConditionerLowerTemperature.text!)
            heaterUpperTemp = Int(heaterUpperTemperature.text!)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        airConditionerLowerTemperature.text = String(UserDefaults.standard.integer(forKey: "airConditionLowerTemp"))
        heaterUpperTemperature.text = String(UserDefaults.standard.integer(forKey: "heaterUpperTemp"))
        
        // Do any additional setup after loading the view.
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

