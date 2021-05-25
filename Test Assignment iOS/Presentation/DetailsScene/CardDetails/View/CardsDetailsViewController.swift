//
//  CardsDetailsViewController.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import UIKit

protocol DetailsPresenterView: AnyObject {
    func update()
}

class CardsDetailsViewController: UIViewController, Routable {
    @IBOutlet weak var cardStackView: UIStackView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var bankNameLbl: UILabel!
    @IBOutlet private weak var cardNumberLbl: UILabel!
    @IBOutlet private weak var cardLogo: UIImageView!
    @IBOutlet private weak var magneticTapeView: UIView!
    
    var presenter: DetailsViewPresenterProtocol!

    var cardState: CardState = .normal
    var timer: Timer?
    var router: Router?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCard()
    }
    
    func initVC() {
        guard let cardsDetailsVC = R.storyboard.cardsDetails.cardsDetailsVC() else { return }
        pushVC(cardsDetailsVC)
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
        if cardState == .normal {
            UIView.transition(with: cardStackView,
                              duration: 0.7,
                              options: [.transitionFlipFromLeft],
                              animations: {
                                self.bankNameLbl.text = "CVV Code ***"
                                self.magneticTapeView.isHidden = false
                                self.cardNumberLbl.isHidden = true
                                self.cardLogo.isHidden = true
                              }){ (_) in
                self.cardState = .turned
                self.timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false){ timer in
                    self.flipBack()}
            }
        }
    }
    
    // MARK: - Flip card back after few seconds
    
    private func flipBack() {
        UIView.transition(with: self.cardStackView,
                          duration: 0.7,
                          options: [.transitionFlipFromRight],
                          animations: {
                            self.bankNameLbl.text = "Bank"
                            self.magneticTapeView.isHidden = true
                            self.cardNumberLbl.isHidden = false
                            self.cardLogo.isHidden = false}, completion: nil)
        self.cardState = .normal
        self.timerInvalidate()
    }
    
    // MARK: - Timer invalidate
    
    private func timerInvalidate() {
        timer?.invalidate()
    }
}

extension CardsDetailsViewController: DetailsPresenterView {
    func update() {
    }
}
