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
    @objc dynamic var id: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var isVisa: Bool = false
    @objc dynamic var date = Date()
    
    convenience init(_ model: CardModel) {
        self.init()
        self.id = model.id ?? ""
        self.image = model.image ?? ""
        self.isVisa = model.isVisa
        self.date = Date()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
