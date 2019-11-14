//
//  StylistTableViewCell.swift
//  XTeam
//
//  Created by paly on 12/11/19.
//  Copyright © 2019 paly. All rights reserved.
//

import UIKit

class StylistTableViewCell: UITableViewCell {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberOfReviewsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationAnnotationImage: UIImageView!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var timeBlurredView: BlurredView!
    @IBOutlet weak var timeLabel: UILabel!
    
    func customizeForStylistCalendarView() {
        ratingView.isHidden = true
        distanceLabel.isHidden = true
        numberOfReviewsLabel.text = "Upcoming"
        locationAnnotationImage.isHidden = true
        locationLabel.text = "Cut & Color"
        timeBlurredView.isHidden = false
        locationLabel.isHidden = false
        timeLabel.text = "9:00 - 10:00 AM"
    }
    
    func setAsTopCell() {
        topConstraint.constant = 16
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationLabel.isHidden = true
        locationAnnotationImage.isHidden = true
        timeBlurredView.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        topConstraint.constant = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
