//
//  AboutUsViewController.swift
//  SmartHome
//
//  Created by Parth on 4/11/18.
//  Copyright © 2018 Akhilesh Lamba. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var about: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var references = ""
        references = "References: \n\n1. https://www.npmjs.com/package/pi-camera\n2. https://cloud.google.com/nodejs/docs/reference/storage/1.3.x/File\n3. https://www.npmjs.com/package/tsl2591\n4. https://www.appcoda.com/ios-charts-api-tutorial/\n5. https://expressjs.com/en/starter/hello-world.html"
        self.about.text = references
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
