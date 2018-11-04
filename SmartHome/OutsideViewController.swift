//
//  OutsideViewController.swift
//  SmartHome
//
//  Created by Akhilesh Lamba on 31/10/18.
//  Copyright © 2018 Akhilesh Lamba. All rights reserved.
//

import UIKit
import Firebase

class OutsideViewController: UIViewController {

    var storageRef = Storage.storage().reference()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        request(url: "http://192.168.1.16:3000/capture")
    }
    
    func request(url: String) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { data, response,
            error in
            if(error != nil) {
                print("URL Error has occured: \(String(describing: error))")
            } else {
                print("Data: \(String(describing: data))")
                print("Response: \(String(describing: response))")
                print("Inside the else part")
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deny(_ sender: Any) {
        request(url: "http://192.168.1.16:3000/off")
        //self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func approve(_ sender: Any) {
        request(url: "http://192.168.1.16:3000/on")
        self.navigationController?.popViewController(animated: true)
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
