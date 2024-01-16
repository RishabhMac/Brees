//
//  CustomTabBar.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 16/01/24.
//

import UIKit

class CustomTabBar: UITabBar {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 12
        layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
}
