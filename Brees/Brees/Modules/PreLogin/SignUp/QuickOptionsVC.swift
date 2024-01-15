//
//  QuickOptionsVC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 14/01/24.
//

import UIKit

class QuickOptionsVC: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backView2: UIView!
    @IBOutlet weak var backView3: UIView!
    @IBOutlet weak var backView4: UIView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        backView.layer.cornerRadius = 16
        backView2.layer.cornerRadius = 16
        backView3.layer.cornerRadius = 16
        backView4.layer.cornerRadius = 16
        image1.layer.cornerRadius = 16
        image2.layer.cornerRadius = 16
        image3.layer.cornerRadius = 16
        image4.layer.cornerRadius = 16
        skipButton.setTitle("Skip", for: .normal)
        skipButton.backgroundColor = .white.withAlphaComponent(0.15)
        skipButton.layer.cornerRadius = skipButton.frame.height/2
        skipButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14)
        skipButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func skipButton(_ sender: Any) {
        
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
