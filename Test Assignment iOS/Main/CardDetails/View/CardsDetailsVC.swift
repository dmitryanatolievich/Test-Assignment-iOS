//
//  CardsDetailsVC.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import UIKit

class CardsDetailsVC: UIViewController {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    var controller = CardsDetailsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCard()
        configureShadow()
    }
    
    private func configureCard() {
        cardView.layer.cornerRadius = 10
    }
    
    func configureShadow() {
        shadowView.layer.cornerRadius = 10
        shadowView.layer.masksToBounds = true
        shadowView.layer.shadowOpacity = 0.25
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        shadowView.layer.shadowRadius = 2
        shadowView.layer.masksToBounds = false
    }
}
