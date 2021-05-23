//
//  Constants.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation
import UIKit

// ---Realm
enum ErrorResultRealm: Error {
    case notFoundElements
    case notExistModel
}

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

enum CardState {
    case normal
    case turned
}
