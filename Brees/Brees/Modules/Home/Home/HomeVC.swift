//
//  HomeVC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 16/01/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet private weak var newAccountBackView: UIView!
    @IBOutlet private weak var notiButton: UIButton!
    @IBOutlet private weak var subHeadingLabel: UILabel!
    @IBOutlet private weak var helloName: UILabel!
    @IBOutlet private weak var addAccountButton: UIButton!
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.backgroundColor = Colors.darkBlueButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func notiButton(_ sender: Any) {
    }
    @IBAction func searchButton(_ sender: Any) {
    }
    
    @IBAction func addAccountButton(_ sender: Any) {
    }
}

extension HomeVC {
    func initialSetup() {
        setFont()
        setText()
        setColor()
        addAccountButton.layer.cornerRadius = addAccountButton.frame.height/2
    }
    
    func setColor() {
        self.view.backgroundColor = Colors.darkBlueButton
        helloName.textColor = .white
        subHeadingLabel.textColor = .white.withAlphaComponent(0.8)
        addAccountButton.setTitleColor(Colors.darkBlueText, for: .normal)
        addAccountButton.backgroundColor = UIColor(red: 203/255, green: 208/255, blue: 251/255, alpha: 1)
    }
    
    func setFont() {
        helloName.font = UIFont(name: "Inter-Bold", size: 16)
        subHeadingLabel.font = UIFont(name: "Inter-Regular", size: 12)
        addAccountButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 12)
    }
    
    func setText() {
        addAccountButton.setTitle("+ Add your account", for: .normal)
    }
}
