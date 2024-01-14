//
//  OnboardingTextCellCC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 11/01/24.
//

import UIKit

class OnboardingTextCellCC: UICollectionViewCell {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var subHeading: UILabel!
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var stactImage3: UIImageView!
    @IBOutlet weak var stackImage2: UIImageView!
    @IBOutlet weak var stackImage1: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        whiteView.layer.cornerRadius = 48
        heading.font = UIFont(name: "Inter-Bold", size: 26)
        subHeading.font = UIFont(name: "Inter-Medium", size: 14)
        heading.textColor = Colors.darkBlueText.withAlphaComponent(1)
        subHeading.textColor = Colors.darkBlueText.withAlphaComponent(0.8)
    }
    
    override func prepareForReuse() {
        heading.text = ""
        subHeading.text = ""
    }
    
    func configure(heading: String, subheading: String, image: String,index: Int) {
        self.heading.text = heading
        self.subHeading.text = subheading
        self.image.image = UIImage(named: image)
        switch index {
        case 0:
            stackImage1.image = UIImage(named: "blueRect")
        case 1:
            stackImage2.image = UIImage(named: "blueRect")
        case 2:
            stactImage3.image = UIImage(named: "blueRect")
        default:
            stactImage3.image = UIImage(named: "blueRect")
        }
    }
}
