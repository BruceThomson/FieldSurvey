//
//  FieldTableViewCell.swift
//  Field Survey
//
//  Created by Bruce Thomson on 7/18/17.
//  Copyright © 2017 Bruce Thomson. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell {
    @IBOutlet weak var fieldImage: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        fieldImage.image = nil
        bottomLabel.text = nil
        topLabel.text = nil
    }

}
