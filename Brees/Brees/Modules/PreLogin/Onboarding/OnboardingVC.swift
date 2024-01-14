//
//  OnboardingVC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 11/01/24.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    var headingArr = ["You ought to know where your money goes","Gain total \ncontrol of your money","Plan ahead and manage your money better"]
    var subheadingArr = ["Get an overview of how you are performing and motivate yourself to achieve even more.","Track your transaction easily, with categories and financial \nreport","Setup your budget for each category so you in control. Track categories you spend the most money on"]
    var imageArr = ["Illustrations1","Illustrations2","Illustrations3"]
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func skipButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if pageIndex < 2 {
            pageIndex += 1
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: IndexPath(item: pageIndex, section: 0), at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        } else if pageIndex == 2 {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension OnboardingVC {

    func initialSetup() {
        setupCollectionView()
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = Colors.darkBlueButton
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        nextButton.setTitleColor(.white, for: .normal)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.backgroundColor = .white.withAlphaComponent(0.15)
        skipButton.layer.cornerRadius = skipButton.frame.height/2
        skipButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14)
        skipButton.setTitleColor(.white, for: .normal)
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let nib = UINib(nibName: "OnboardingTextCellCC", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "OnboardingTextCellCC")
    }
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingTextCellCC", for: indexPath) as! OnboardingTextCellCC
        cell.configure(heading: headingArr[indexPath.row], subheading: subheadingArr[indexPath.row], image: imageArr[indexPath.row], index: indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageIndex = indexPath.row
        if pageIndex == 2 {
            nextButton.setTitle("Get Started", for: .normal)

        } else {
            nextButton.setTitle("Next", for: .normal)
        }
        print(pageIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
