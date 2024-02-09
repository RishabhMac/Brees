//
//  BudgetCellTC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 31/01/24.
//

import UIKit

class BudgetCellTC: UITableViewCell {

    @IBOutlet private weak var backBlueView: UIView!
    @IBOutlet private weak var budgetType: UILabel!
    @IBOutlet private weak var budgetImage: UIImageView!
    @IBOutlet private weak var budgetName: UILabel!
    @IBOutlet private weak var budgetSubName: UILabel!
    @IBOutlet private weak var budgetAmount: UILabel!
    @IBOutlet private weak var budgetProgress: UIProgressView!
    @IBOutlet private weak var budgetStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setColor()
        setFont()
        setText()
        backBlueView.layer.cornerRadius = 16
        self.selectionStyle = .none
    }
    
    func setColor() {
        budgetType.textColor = .white
        budgetName.textColor = .white
        budgetSubName.textColor = .white.withAlphaComponent(0.8)
        budgetAmount.textColor = Colors.greenText
        budgetProgress.progressTintColor = Colors.greenText
        budgetProgress.backgroundColor = Colors.greenText.withAlphaComponent(0.3)
        budgetStatus.textColor = .white
    }
    
    func setText() {
        budgetType.text = "Monthly Budget"
        budgetName.text = "Flexing Buget"
        budgetSubName.text = "N140 daily"
        budgetAmount.text = "N18,241"
        budgetStatus.text = "You are doing really great!"
    }
    
    func setFont() {
        budgetType.font = UIFont(name: "Inter-SemiBold", size: 12)
        budgetName.font = UIFont(name: "Inter-SemiBold", size: 14)
        budgetSubName.font = UIFont(name: "Inter-Regular", size: 12)
        budgetAmount.font = UIFont(name: "Inter-Bold", size: 14)
        budgetStatus.font = UIFont(name: "Inter-Medium", size: 11)
    }
    
}
