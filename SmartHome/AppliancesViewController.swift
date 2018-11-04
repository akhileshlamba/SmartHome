//
//  AppliancesViewController.swift
//  SmartHome
//
//  Created by Akhilesh Lamba on 1/11/18.
//  Copyright © 2018 Akhilesh Lamba. All rights reserved.
//

import UIKit
import Firebase

class AppliancesViewController: UIViewController {


    @IBOutlet weak var textLabel: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var applianceName : String?
    
    var databaseRef = Database.database().reference().child("raspio")
    var list = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch applianceName {
        case "ac"?:
            imageView.image = UIImage(named:"air_conditioner")
            request(url: "http://192.168.1.16:3000/currentTemperature", type: "ac")
            break
        case "heater"?:
            imageView.image = UIImage(named: "heater")
            request(url: "http://192.168.1.16:3000/currentTemperature", type: "heater")
        case "lights"?:
            imageView.image = UIImage(named: "bulbOn")
            request(url: "http://192.168.1.16:3000/light", type: "light")
        default:
            print("appliance name: \(String(describing: applianceName))")
            print("Not a valid selection")
        }
        
        // Do any additional setup after loading the view.
    }

    func request(url: String, type: String) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { data, response,
            error in
            if(error != nil) {
                print("URL Error has occured: \(String(describing: error))")
            } else {
                
                print("Data: \(String(describing: data))")
                print("Response: \(String(describing: response))")
                print("Inside the else part")
                var temperature = 0.0
                var lightCondition = ""
                do
                {
                    let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if type == "light"{
                        lightCondition = (result.value(forKey: "temp") as? String)!
                    }
                    else{
                        temperature = (result.value(forKey: "temp") as? Double)!
                    }
                    
                } catch let error as NSError {
                    print("JSON Serialization ERROR: \(error)") }
                DispatchQueue.main.async {
                    switch type {
                    case "ac":
                        self.textLabel.text = "Current Temperature is :\(temperature)"
                        if Int(temperature) > UserDefaults.standard.integer(forKey: "airConditionLowerTemp"){
                            self.switchOnOff(url: "http://192.168.1.16:3000/switchon?id=ac",type: "ac")
                            self.button.setTitle("Switch Off", for: UIControlState.normal)
                        }
                    case "heater":
                        self.textLabel.text = "Current Temperature is :\(temperature)"
                        if Int(temperature) < UserDefaults.standard.integer(forKey: "heaterUpperTemp"){
                            self.switchOnOff(url: "http://192.168.1.16:3000/switchon?id=heater",type: "heater")
                            self.button.setTitle("Switch Off", for: UIControlState.normal)
                        }
                    case "light":
                        self.textLabel.text = "Current lighting condition in room is :\(lightCondition)"
                    default:
                        print("Invalid selection")
                    }
                    
                }
            }
        }
        task.resume()
    }
    
    func switchOnOff(url: String, type: String) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { data, response,
            error in
            if(error != nil) {
                print("URL Error has occured: \(String(describing: error))")
            } else {
                print("Data: \(String(describing: data))")
                print("Response: \(String(describing: response))")
                print("Inside the else part")
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func on_off(_ sender: UIButton) {
        if applianceName == "ac"{
            if sender.titleLabel?.text == "Switch On" {
                switchOnOff(url: "http://192.168.1.16:3000/switchon?id=ac",type: "ac")
                sender.setTitle("Switch Off", for: UIControlState.normal)
            }
            else {
                switchOnOff(url: "http://192.168.1.16:3000/switchoff?id=ac",type: "ac")
                sender.setTitle("Switch On", for: UIControlState.normal)
            }
        }
        else if applianceName == "heater"{
            if sender.titleLabel?.text == "Switch On" {
                switchOnOff(url: "http://192.168.1.16:3000/switchon?id=heater",type: "heater")
                sender.setTitle("Switch Off", for: UIControlState.normal)
            }
            else {
                switchOnOff(url: "http://192.168.1.16:3000/switchoff?id=heater",type: "heater")
                sender.setTitle("Switch On", for: UIControlState.normal)
            }
        }
        else if applianceName == "lights"{
            if sender.titleLabel?.text == "Switch On" {
                switchOnOff(url: "http://192.168.1.16:3000/switchon?id=lights",type: "lights")
                sender.setTitle("Switch Off", for: UIControlState.normal)
            }
            else {
                switchOnOff(url: "http://192.168.1.16:3000/switchoff?id=lights",type: "lights")
                sender.setTitle("Switch On", for: UIControlState.normal)
            }
        }
        
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
