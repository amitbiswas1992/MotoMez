//
//  ReceiveViewController.swift
//  Motomez
//
//  Created by Maze Geek on 7/2/18.
//  Copyright © 2018 Amit Biswas. All rights reserved.
// // last modify - 07/16 - 4.45 AM

import UIKit
import  BarcodeScanner

var codeArrayReceive = [String]()
var codeArrayReturn = [String]()
var codeArrayDamage = [String]()


// Inventory Type
var inventoryType = ""

class ScanTypeViewController: UIViewController,BarcodeScannerCodeDelegate,BarcodeScannerDismissalDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        if  inventoryType != ""{
            
        presentScannerView()
            
        }
        self.title = "Select Inventory"
    }
    
   // Scanner Function
func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
       
        if inventoryType == "receive"{
         codeArrayReceive += [code]
         print(codeArrayReceive)
        }
        else if inventoryType == "return"{
            
            codeArrayReturn += [code]
            print(codeArrayReturn)

        }
        else{
            
            codeArrayDamage += [code]
            print(codeArrayDamage)

        }
        // Alert Implementation
        let alert = UIAlertController(title: "Partsnumber", message: "Product Added Succesfully ", preferredStyle: .alert)
        
        
        let addAction = UIAlertAction(title: "Scan Again", style: .default) { (action) in
          
              controller.reset(animated: true)
         }
        
        alert.addAction(addAction)
        
        // Cancel action when code array lenght is 0
        
       
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                codeArrayReceive.removeAll()
                controller.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(cancelAction)
        
        // if inventoryType == "receive"{
        
            let finishAction = UIAlertAction(title: "Proceed to list ", style: .default) { (action) in
                
                let inventoryVC:InventoryViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InventoryViewController")  as! InventoryViewController
                
                inventoryVC.barCodeData = codeArrayReceive
                
                self.navigationController?.pushViewController(inventoryVC, animated: true)
               
                controller.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(finishAction)
            
        
            controller.present(alert, animated: true, completion: nil)
    
    // }
//        else if inventoryType == "return"{
//
//            let finishAction = UIAlertAction(title: "Proceed to list ", style: .default) { (action) in
//
//                let ReturnVC:ReturnViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReturnViewController")  as! ReturnViewController
//
//                ReturnVC.barCodeDataReturn = codeArrayReturn
//
//                self.navigationController?.pushViewController(ReturnVC, animated: true)
//
//                controller.dismiss(animated: true, completion: nil)
//            }
//
//            alert.addAction(finishAction)
//
//
//            controller.present(alert, animated: true, completion: nil)
//        }
    
//        else {
//            let finishAction = UIAlertAction(title: "Proceed to list ", style: .default) { (action) in
//
//                let ReturnVCDamage:DamageReturnViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DamageReturnViewController")  as! DamageReturnViewController
//
//                ReturnVCDamage.barCodeDataDamage = codeArrayDamage
//
//                self.navigationController?.pushViewController(ReturnVCDamage, animated: true)
//
//                controller.dismiss(animated: true, completion: nil)
//            }
//
//            alert.addAction(finishAction)
//
//
//            controller.present(alert, animated: true, completion: nil)
//
//        }
    
    }
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        print(codeArrayReceive)
        inventoryType = ""
        controller.dismiss(animated: true, completion: nil)
        
    }
    

    
    @IBAction func receiveButton(_ sender: UIButton) {
   
        inventoryType = "receive"
        presentScannerView()
        
    
    }
    
    
    @IBAction func returnButton(_ sender: UIButton) {
    
    inventoryType = "return"
    
    presentScannerView()
    
    }
    
    
    @IBAction func damageReturnButton(_ sender: UIButton) {
    
      inventoryType = "damage_return"
      presentScannerView()
    }
    
    func presentScannerView(){
        
        let scanner = BarcodeScannerViewController()
        scanner.codeDelegate = self
        scanner.dismissalDelegate = self
        //print("Scan Type \(scanType!)")
        //scanner.isOneTimeSearch = false
        present(scanner, animated: true, completion: nil)
        
        
    }
    
    func checkReceivingAction(){
       
        if partAction == "Scan" {

        }
          else if partAction == "List" {
            
        }
        
    }
    
    
    // Creating custon type of action

    var  partAction : String =  ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       print(partAction)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
   
    //fucntion for go to scanner from any button Receive, Return , Damage return)
    
    func gotoScannerViewController( scanType: String ){
        
    }
    

}
