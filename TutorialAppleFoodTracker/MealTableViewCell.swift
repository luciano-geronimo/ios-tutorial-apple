//
//  MealTableViewCell.swift
//  TutorialAppleFoodTracker
//
//  Created by LUCIANO G LISBOA on 30/05/19.
//  Copyright © 2019 LUCIANO G LISBOA. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
