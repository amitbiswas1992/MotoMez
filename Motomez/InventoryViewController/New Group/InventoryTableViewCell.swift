//
//  InventoryTableView.swift
//  Motomez
//
//  Created by Maze Geek on 7/12/18.
//  Copyright © 2018 Amit Biswas. All rights reserved.
//// last modify - 07/16 - 4.45 AM

import UIKit

class InventoryTableViewCell: UITableViewCell {

   
   
    
    @IBOutlet weak var partnumberLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
  
     @IBOutlet weak var minusButtonPressed: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
  
    
    
    // variable for action
    
    var onMinusTapped: (() -> Void)? = nil
    var onPlusTapped: (() -> Void)? = nil
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        
        if let onMinusTapped = self.onMinusTapped {
            
            onMinusTapped()
            
        }
        
    }
    
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        
        if let onPlusTapped = self.onPlusTapped {
            
            onPlusTapped()
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
}
