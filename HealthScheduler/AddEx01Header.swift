//
//  AddEx01Header.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 9..
//  Copyright © 2017년 iamqjin. All rights reserved.
//


import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: AddEx01Header, section: Int)
}

class AddEx01Header: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let titleLabel = UILabel()
    let arrowLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        //
        // Constraint the size of arrow label for auto layout
        //
        arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
        arrowLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowLabel)
        
        //
        // Call tapHeader when tapping on this header
        //
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddEx01Header.tapHeader(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        contentView.backgroundColor = UIColor(red: 3/255.0, green: 121/255.0, blue: 251/255.0, alpha: 1.0)
        
        contentView.backgroundColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0)
        
        titleLabel.textColor = UIColor.black
        arrowLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "TmonMonsori.otf.otf", size: 15)
        
        //
        // Autolayout the lables
        //
        let views = [
            "titleLabel" : titleLabel,
            "arrowLabel" : arrowLabel,
            ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-20-[titleLabel]-[arrowLabel]-20-|",
            options: [],
            metrics: nil,
            views: views
        ))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[titleLabel]-|",
            options: [],
            metrics: nil,
            views: views
        ))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[arrowLabel]-|",
            options: [],
            metrics: nil,
            views: views
        ))
    }
    
    //
    // Trigger toggle section when tapping on the header
    //
    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? AddEx01Header else {
            return
        }
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        arrowLabel.rotate(collapsed ? 0.0 : CGFloat(M_PI_2))
    }
    
}
