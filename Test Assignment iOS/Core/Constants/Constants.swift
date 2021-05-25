//
//  Constants.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation
import UIKit

// MARK: - Realm

enum ErrorResultRealm: Error {
    case notFoundElements
    case notExistModel
}

// MARK: - Payment system image and first numbers for visa and mastercard

enum PaymentSystem: String, CaseIterable {
    
    var imageName: UIImage? {
        switch self {
        case .visa:
            return R.image.visa()
        case .mastercard:
            return R.image.mastercard()
        }
    }
    
    case visa = "41"
    case mastercard = "51"
}

// MARK: - Card state

enum CardState {
    case normal
    case turned
}

enum Scene {
    case details(CardModel)
    
    var initiateVC: UIViewController? {
        switch self {
        case .details(let cardModel):
            guard let viewController = R.storyboard.cardsDetails.cardsDetailsVC() else { return nil }
            viewController.presenter = DetailsViewPresenter(view: viewController, cardModel: cardModel)
            return viewController
        }
    }
}
