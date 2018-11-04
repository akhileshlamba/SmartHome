//
//  LineChartViewController.swift
//  SmartHome
//
//  Created by Akhilesh Lamba on 2/11/18.
//  Copyright © 2018 Akhilesh Lamba. All rights reserved.
//

import UIKit
import Charts
import Firebase

class LineChartViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    var databaseRef = Database.database().reference().child("raspio")
    var list = [NSDictionary]()
    var temperature = [Double]()
    var applianceName : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondTab = self.tabBarController?.viewControllers![0] as! AppliancesViewController
        self.applianceName = secondTab.applianceName

        switch applianceName {
        case "ac"?, "heater"?:
            callData(applianceName : "ac")
        case "lights"?:
            callData(applianceName : "lights")
        default:
            print("Invalid selection")
        }
        
    }

    func callData(applianceName: String){
        databaseRef.observe(.childAdded, with: {snapshot in
            let snapshotValue = snapshot.value as! NSDictionary
            let temperature = snapshotValue["temperature"] as! Double
            let lightData = snapshotValue["lightData"] as! NSDictionary
            let light = lightData["vis_ir"] as! Double
            let dict : NSDictionary = [
                "light" : light,
                "temperature": temperature
            ]
            self.list.append(dict)
            if applianceName == "ac"{
                self.temperature.append(temperature)
            }else{
                self.temperature.append(light)
            }
            self.setChart(temperature: self.temperature)
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setChart(temperature: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<temperature.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: temperature[i])
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Temperature")
        lineChartDataSet.drawFilledEnabled = true
        lineChartDataSet.setCircleColor(UIColor.black)
        lineChartDataSet.fillColor = UIColor.black
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
        lineChartView.setScaleEnabled(true)
        lineChartView.setVisibleXRangeMaximum(10)
        lineChartView.moveViewToX(90)
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
