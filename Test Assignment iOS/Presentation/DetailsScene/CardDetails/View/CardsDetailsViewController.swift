//
//  CardsDetailsViewController.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import UIKit


protocol DetailsPresenterView: AnyObject {
    func updateState(_ cardState: CardState)
}

class CardsDetailsViewController: UIViewController {
    
    @IBOutlet private weak var cardStackView: UIStackView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var bankNameLbl: UILabel!
    @IBOutlet private weak var cardNumberLbl: UILabel!
    @IBOutlet private weak var cardLogo: UIImageView!
    @IBOutlet private weak var magneticTapeView: UIView!
    
    var presenter: DetailsViewPresenterProtocol!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCard()
    }
    
    // MARK: - Configure card design
    
    private func configureCard() {
        configureShadow()
        magneticTapeView.isHidden = true
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = presenter.cardModel.paymentSystemType == .visa ?
            R.color.visaColor() :
            R.color.mastercardColor()
        cardNumberLbl.text = presenter.cardModel.cardNumber.maskedCardNumber()
        cardLogo.image = presenter.cardModel.image
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        cardView.addGestureRecognizer(tap)
    }
    
    // MARK: - Configure card shadow
    
    private func configureShadow() {
        shadowView.layer.cornerRadius = 10
        shadowView.layer.masksToBounds = true
        shadowView.layer.shadowOpacity = 0.25
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        shadowView.layer.shadowRadius = 2
        shadowView.layer.masksToBounds = false
    }
    
    // MARK: - Animate card when tap
    
    @objc func handleTap() {
        presenter.turnCard()
    }
    
    private func turnCard(forState: CardState) {
        UIView.transition(with: cardStackView,
                          duration: 0.7,
                          options: forState == .turned ?
                            [.transitionFlipFromLeft] :
                            [.transitionFlipFromRight],
                          animations: {
                            self.bankNameLbl.text = forState == .turned ?
                                "CVV Code ***" :
                                "Bank"
                            self.magneticTapeView.isHidden = forState == .normal
                            self.cardNumberLbl.isHidden = forState == .turned
                            self.cardLogo.isHidden = forState == .turned
                          })
    }
    
}

extension CardsDetailsViewController: DetailsPresenterView {
   
    func updateState(_ cardState: CardState) {
        turnCard(forState: cardState)
    }
}
