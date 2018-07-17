//
//  ViewController.swift
//  Motomez
//
//  Created by Maze Geek on 6/22/18.
//  Copyright © 2018 Amit Biswas. All rights reserved.
//

import UIKit
import BarcodeScanner


class HomeViewController: UIViewController, BarcodeScannerCodeDelegate, BarcodeScannerDismissalDelegate, UITableViewDataSource, UITableViewDelegate{
   
    
    //  declairing array for Barcode dictionary
    
    var barCodeData   = ["BM1200123","CH1240128", "MB1000788"]

    // Table View Function

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return barCodeData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell( style: UITableViewCellStyle.default , reuseIdentifier: "Cell")
        cell.textLabel?.text = barCodeData[indexPath.row]
        return cell
    }

    // Button Outlet

    @IBOutlet weak var scanButton: UIButton!
    
    @IBOutlet weak var listButton: UIButton!
    
    
    
    // declairing global variable for barcodescanner
    
    let scanner = BarcodeScannerViewController()
    
    @IBOutlet weak var showScannerCode: UILabel!
  
    @IBAction func showBarCodeScanner(_ sender: Any) {
    
        present(scanner, animated: true, completion: nil)
        
        }
    
    @IBAction func cancelScanBarcodeView(_ sender: Any) {
       
    print("Cancelled Scan Barcode View ")
        
    }
    
    // dismiss scanner
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
      
        
        print("Dismissed")
    }
    
    // collect code from barcode
    
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        showScannerCode.text = code
        controller.dismiss(animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanner.codeDelegate = self
        // scanner.errorDelegate = self
        scanner.dismissalDelegate = self
        scanner.isOneTimeSearch = false
        
    
    }
   
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
      
       let receiveVC = segue.destination as! ScanTypeViewController
        
        if (segue.identifier == "scanButtonSegue" ){
            receiveVC.partAction = "Scan"
        
        } else if (segue.identifier == "listButtonSegue" ){
            
            receiveVC.partAction = "list"
        }
        
   
        
    }
    
}

