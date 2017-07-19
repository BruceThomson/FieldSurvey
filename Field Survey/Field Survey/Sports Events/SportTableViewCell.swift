//
//  SportTableViewCell.swift
//  Sports Events
//
//  Created by Bruce Thomson on 3/10/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportLabel: UILabel!
    @IBOutlet weak var sportSublabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        sportImage.image = nil
        sportLabel.text = nil
        sportSublabel.text = nil
    }

}
