//
//  CustomTableViewCell.swift
//  MeFit
//
//  Created by B M PRATEEK KUSHALAPPA on 02/05/20.
//  Copyright © 2020 CanTin Squad. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var completed = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

  
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var lbl1: UILabel!
}
