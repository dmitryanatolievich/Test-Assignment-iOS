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
    var image: UIImage?
    var date = Date()
    
    init(paymentSystem: PaymentSystem) {
        self.paymentSystemType = paymentSystem
        self.cardNumber = paymentSystem.rawValue + String().randomString()
        self.image = paymentSystem.imageName
    }
}
