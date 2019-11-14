//
//  CalendarCollectionViewCell.swift
//  XTeam
//
//  Created by paly on 12/11/19.
//  Copyright © 2019 paly. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSelection(state: false)
    }
    
    func set(date: Date) {
        var dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "dd"
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString
        
        dateFormatter =  DateFormatter.init()
        dateFormatter.dateFormat = "E"
        let dayString = dateFormatter.string(from: date)
        dayLabel.text = dayString
    }
    
    func setSelection(state: Bool) {
        if state {
            self.mainView.backgroundColor = UIColor.init(hexString: "#b79b7e")
            dateLabel.textColor = UIColor.white
            dayLabel.textColor = UIColor.white
        } else {
            self.mainView.backgroundColor = UIColor.init(hexString: "#e9e1d8")
            dateLabel.textColor = UIColor.init(hexString: "#b79b7e")
            dayLabel.textColor = UIColor.init(hexString: "#b79b7e")
        }
    }


}
