//
//  CardModelDB.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation
import Realm
import RealmSwift

class CardModelDB: Object {
    @objc dynamic var cardNumber: String = ""
    @objc dynamic var date = Int()

    convenience init(_ model: CardModel) {
        self.init()
        self.cardNumber = model.cardNumber
        self.date = model.date
    }

    override static func primaryKey() -> String? {
        return "cardNumber"
    }
}
