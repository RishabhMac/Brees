//
//  CustomTabBar.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 16/01/24.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        updateTabBarAppearance()
    }

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateTabBarAppearance()
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateTabBarAppearance()
    }

    private func updateTabBarAppearance() {
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 23
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.subviews.forEach {
            if $0.accessibilityIdentifier == "TabBarShadow" {
                $0.removeFromSuperview()
            }
        }
        let shadowView = UIView(frame: .zero)
        shadowView.frame = tabBar.frame
        shadowView.accessibilityIdentifier = "TabBarShadow"
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.cornerRadius = tabBar.layer.cornerRadius
        shadowView.layer.maskedCorners = tabBar.layer.maskedCorners
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        let selectedTabIndex = selectedIndex
        if selectedTabIndex == 0 {
            shadowView.layer.shadowColor = UIColor.clear.cgColor
        }
        shadowView.layer.shadowOffset = CGSize(width: 0.0, height: -8.0)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = 20
        view.addSubview(shadowView)
        view.bringSubviewToFront(tabBar)
    }
}
