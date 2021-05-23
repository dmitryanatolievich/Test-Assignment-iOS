//
//  MainController.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//
import Foundation
import UIKit

class MainController: NSObject {
    
    var cardModel = [CardModel]()
    
    lazy var didTouchAddCard = {
        self.generateCardNumber()
    }
    
    lazy var didTouchCell: (_ index: Int) -> Void = { [weak self] index in
        guard let self = self else { return }
        let cardsDetailsController = CardsDetailsController()
        cardsDetailsController.cardModel = self.cardModel[index]
        cardsDetailsController.initVC()
    }
    
    func cardType() -> PaymentSystem {
        let arr: [PaymentSystem] = PaymentSystem.allCases
        let index = Int.random(in: 0..<arr.count)
        return arr[index]
    }

    private func generateCardNumber() {
        let model = CardModel(paymentSystem: cardType())
        cardModel.append(model)
    }
}

