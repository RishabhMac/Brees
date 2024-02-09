//
//  BudgetVC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 19/01/24.
//

import UIKit

class BudgetVC: UIViewController {

    @IBOutlet weak var createNewBudgetButton: UIButton!
    @IBOutlet weak var totalBudgetLabel: UILabel!
    @IBOutlet weak var budgetLeftLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var whiteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.backgroundColor = .white
    }
    
    @IBAction func createNewBudgetButton(_ sender: Any) {
        
    }
}

extension BudgetVC {
    func initialSetup() {
        setFont()
        setText()
        setColor()
        setupTableView()
        createNewBudgetButton.layer.cornerRadius = createNewBudgetButton.frame.height/2
        whiteView.layer.masksToBounds = true
        whiteView.layer.cornerRadius = 30
        whiteView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    func setColor() {
        self.view.backgroundColor = Colors.darkBlueButton
        budgetLeftLabel.textColor = .white
        totalBudgetLabel.textColor = .white.withAlphaComponent(0.8)
        createNewBudgetButton.setTitleColor(Colors.darkBlueText, for: .normal)
        createNewBudgetButton.backgroundColor = UIColor(red: 203/255, green: 208/255, blue: 251/255, alpha: 1)
    }
    
    func setFont() {
        budgetLeftLabel.font = UIFont(name: "Inter-Bold", size: 28)
        totalBudgetLabel.font = UIFont(name: "Inter-Medium", size: 14)
        createNewBudgetButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 10)
    }
    
    func setText() {
        createNewBudgetButton.setTitle("+ Create new budget", for: .normal)
        budgetLeftLabel.text = "0"
        totalBudgetLabel.text = "You have no budget"
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "BudgetCellTC", bundle: nil), forCellReuseIdentifier: "BudgetCellTC")

        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
}

extension BudgetVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetCellTC", for: indexPath) as? BudgetCellTC else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
