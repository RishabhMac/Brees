//
//  WelcomeVC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 14/01/24.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var nameText = "name"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedButton.setTitle("Let’s get started", for: .normal)
        getStartedButton.backgroundColor = Colors.darkBlueButton
        getStartedButton.layer.cornerRadius = getStartedButton.frame.height/2
        getStartedButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 14)
        getStartedButton.setTitleColor(.white, for: .normal)
        welcomeLabel.font = UIFont(name: "Inter-Medium", size: 24)
        welcomeLabel.textColor = Colors.darkBlueText
        helloLabel.font = UIFont(name: "Inter-Medium", size: 24)
        helloLabel.textColor = Colors.darkBlueText
        nameLabel.font = UIFont(name: "Inter-Bold", size: 24)
        nameLabel.textColor = Colors.darkBlueText
        nameLabel.text = nameText
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func getStartedButton(_ sender: Any) {
    }
}
