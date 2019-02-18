//
//  DayCell.swift
//  GSDA
//
//  Created by Joriah Lasater on 2/1/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import JTAppleCalendar

class DayCell: JTAppleCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    func setup() {
        addSubview(dateLabel)
        
        dateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        layer.cornerRadius = frame.width/7
        clipsToBounds = true
    }
}
