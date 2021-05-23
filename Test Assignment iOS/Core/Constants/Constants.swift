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

enum CardState {
    case normal
    case turned
}
