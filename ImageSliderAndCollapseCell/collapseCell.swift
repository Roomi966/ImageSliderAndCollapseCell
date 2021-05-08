//
//  collapseCell.swift
//  ImageSliderAndCollapseCell
//
//  Created by EHSAN YAQOOB on 29/04/2021.
//  Copyright © 2021 EHSAN YAQOOB. All rights reserved.
//

import UIKit

class collapseCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblID: UILabel!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    
    @IBOutlet weak var lblUserDetalis: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
