//
//  InventoryViewController.swift
//  Motomez
//
//  Created by Maze Geek on 7/10/18.
//  Copyright © 2018 Amit Biswas. All rights reserved.
//

import UIKit
import BarcodeScanner

class DamageReturnViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    var barCodeDataDamage  = [String]()
    var arrayInt : [String: Int] = [:]
    var arrayCount = [Int]()
    var arrayStringElements : [String] = []
    
    @IBOutlet weak var inventoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in barCodeDataDamage {
            arrayInt[item] = (arrayInt[item] ?? 0) + 1
        }
        for (key, value) in arrayInt {
            print("\(key) occurs \(value) time(s)")
            arrayCount.append(value)
            arrayStringElements.append(key)
        }
        
        print(inventoryType)
        
        inventoryTableView.dataSource = self
        inventoryTableView.delegate = self
        
        
    }
    
    
    
    // Table View Function
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: InventoryTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "InventoryTableViewCell") as? InventoryTableViewCell
        
        
        if cell == nil {
            let nibName = UINib.init(nibName: "InventoryTableViewCell", bundle: nil)
            
            // register nib
            tableView.register(nibName, forCellReuseIdentifier: "InventoryTableViewCell")
            
            cell  = tableView.dequeueReusableCell(withIdentifier: "InventoryTableViewCell") as? InventoryTableViewCell
            
        }
        
        cell?.partnumberLabel.text = arrayStringElements[indexPath.row]
        cell?.quantityLabel.text = String(arrayCount[indexPath.row])
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCount.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}



