//
//  MainController.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//
import Foundation
import UIKit

class MainController: NSObject {
    
    var cardModel = CardModel()
    var cardNumber: Int?
    var cardsNumbersArr: [Int?] = []
    
    lazy var didTouchAddCard = {
        self.generateCardNumber()
        self.cardModel.id = "\(String(describing: self.cardNumber))"
        print(self.cardsNumbersArr)
    }
    
    lazy var didTouchCell = {
        let cardsDetailsController = CardsDetailsController()
        cardsDetailsController.initVC()
    }
    
    private func generateCardNumber() {
        let randomNum = Int.random(in: 5000000000000000...5999999999999999)
        cardNumber = randomNum
        cardsNumbersArr.append(cardNumber)
    }
}

