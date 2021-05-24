//
//  CardsDetailsController.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation
import UIKit

class CardsDetailsController: NSObject, MainControllerProtocol {
    
    var cardModel: CardModel?
    
    // MARK: - Init VC

    func initVC() {
        guard let cardsDetailsVC = R.storyboard.cardsDetails.cardsDetailsVC() else { return }
        cardsDetailsVC.controller = self
        pushVC(cardsDetailsVC)
    }
}
