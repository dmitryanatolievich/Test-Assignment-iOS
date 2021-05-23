//
//  CardModel.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation

class CardModel {
    var id: String?
    var image: String?
    var isVisa: Bool = false
    var date = Date()
    
    convenience init(wallpepersModel: CardModelDB) {
        self.init()
        self.id = wallpepersModel.id
        self.image = wallpepersModel.image
        self.isVisa = wallpepersModel.isVisa
        self.date = wallpepersModel.date
    }
}
