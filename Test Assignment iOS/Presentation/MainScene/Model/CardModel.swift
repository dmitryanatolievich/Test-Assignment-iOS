//
//  CardModel.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation
import UIKit

struct CardModel {
    var cardNumber: String
    var paymentSystemType: PaymentSystem
    var image: UIImage
    var date = Int(Date().timeIntervalSince1970)
    
    init(paymentSystem: PaymentSystem) {
        self.paymentSystemType = paymentSystem
        self.cardNumber = paymentSystem.rawValue + String().randomString()
        self.image = paymentSystem.imageName ?? UIImage()
    }
    
    init(cardModel: CardModelDB) {
        let preffix = String(cardModel.cardNumber.prefix(2))
        if let system = PaymentSystem(rawValue: preffix) {
            self.paymentSystemType = system
            self.cardNumber = cardModel.cardNumber
            self.image = system.imageName ?? UIImage()
            self.date = cardModel.date
        } else {
            fatalError()
        }
    }
}
