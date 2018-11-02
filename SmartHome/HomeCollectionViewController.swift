//
//  HomeCollectionViewController.swift
//  SmartHome
//
//  Created by Akhilesh Lamba on 23/10/18.
//  Copyright © 2018 Akhilesh Lamba. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DefaultCell"

class HomeCollectionViewController: UICollectionViewController {

    var icons = NSMutableArray()
    var labels = NSMutableArray()
    var ac = false
    var heater = false
    var lights = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icons.add("air_conditioner")
        icons.add("bulbOn")
        icons.add("heater")
        icons.add("house")
        
        labels.add("Air Conditioner")
        labels.add("Lights")
        labels.add("Heater")
        labels.add("camera")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ac = false
        heater = false
        lights = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return icons.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DefaultCells
        
        cell.imageView.image = UIImage(named: icons[indexPath.row] as! String)
        cell.textLabel.text = labels[indexPath.row] as? String
        
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = labels[indexPath.row] as! String
        if name == "camera" {
//            let viewController = storyboard?.instantiateViewController(withIdentifier: "camera")
//            self.navigationController?.pushViewController(viewController!, animated: true)
            self.performSegue(withIdentifier: "outside", sender: nil)
        } else if name == "Air Conditioner"{
//            let viewController = storyboard?.instantiateViewController(withIdentifier: "appliances")
//            self.navigationController?.pushViewController(viewController!, animated: true)
            ac = true
            self.performSegue(withIdentifier: "appliances", sender: nil)
        }
        else if name == "Heater"{
//            let viewController = storyboard?.instantiateViewController(withIdentifier: "appliances")
//            self.navigationController?.pushViewController(viewController!, animated: true)
            heater = true
            self.performSegue(withIdentifier: "appliances", sender: nil)
        }
        else if name == "Lights"{
//            let viewController = storyboard?.instantiateViewController(withIdentifier: "appliances")
//            self.navigationController?.pushViewController(viewController!, animated: true)
            lights = true
            self.performSegue(withIdentifier: "appliances", sender: nil)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "appliances" && ac{
            print("Inside segue")
            
            let barViewControllers = segue.destination as! UITabBarController
            if let destViewController = barViewControllers.childViewControllers.first as? AppliancesViewController{
                print("Inside segue AC")
                destViewController.applianceName = "ac"
            }
            
        }
        else if segue.identifier == "appliances" && heater{
            let barViewControllers = segue.destination as! UITabBarController
            if let destViewController = barViewControllers.childViewControllers.first as? AppliancesViewController{
                print("Inside segue heater")
                destViewController.applianceName = "heater"
            }
        }
        else if segue.identifier == "appliances" && lights{
            let barViewControllers = segue.destination as! UITabBarController
            if let destViewController = barViewControllers.childViewControllers.first as? AppliancesViewController{
                print("Inside segue lights")
                destViewController.applianceName = "lights"
            }
        }
        
    }
    
}
