//
//  Util.swift
//  SmartHome
//
//  Created by Akhilesh Lamba on 2/11/18.
//  Copyright © 2018 Akhilesh Lamba. All rights reserved.
//

import UIKit

class Util: NSObject {

    static func request(url: String) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { data, response,
            error in
            if(error != nil) {
                print("URL Error has occured: \(String(describing: error))")
            } else {
                print("Data: \(String(describing: data))")
                print("Response: \(String(describing: response))")
                print("Inside the else part")
//                DispatchQueue.main.async {
//                    self.imageView.image = UIImage(data: data!)
//                }
            }
        }
        task.resume()
    }
    
}
