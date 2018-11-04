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
        if(airConditionerLowerTemperature.text != "" && heaterUpperTemperature.text != "" ){
            let acTemp = Int(airConditionerLowerTemperature.text!) ?? 24
            let heatTemp = Int(heaterUpperTemperature.text!) ?? 14
            if(acTemp > heatTemp){
            UserDefaults.standard.set(Int(airConditionerLowerTemperature.text!), forKey: "airConditionLowerTemp")
            UserDefaults.standard.set(Int(heaterUpperTemperature.text!), forKey: "heaterUpperTemp")
            airConditionLowerTemp = Int(airConditionerLowerTemperature.text!)
            heaterUpperTemp = Int(heaterUpperTemperature.text!)
            self.navigationController?.popViewController(animated: true)
            }
            else{
                displayErrorMessage("Please make sure the air conditioner temperature is greater than heater temperature.")
                
            }
            
        }
        else{
            displayErrorMessage("Please configure values for both air conditioner and heater.")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        airConditionerLowerTemperature.text = String(UserDefaults.standard.integer(forKey: "airConditionLowerTemp"))
        heaterUpperTemperature.text = String(UserDefaults.standard.integer(forKey: "heaterUpperTemp"))
        
        // Do any additional setup after loading the view.
    }
    func displayErrorMessage(_ errorMessage: String){
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
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

