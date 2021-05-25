//
//  DetailsViewPresenter.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 24.05.2021.
//

import Foundation

protocol DetailsViewPresenterOutput {
    var cardModel: CardModel { get set }
    init(view: DetailsPresenterView, cardModel: CardModel)
}

protocol DetailsViewPresenterProtocol: DetailsViewPresenterOutput {}

class DetailsViewPresenter: DetailsViewPresenterProtocol {
    
    var cardModel: CardModel
    
    private weak var view: DetailsPresenterView?
    
    required init(view: DetailsPresenterView, cardModel: CardModel) {
        self.view = view
        self.cardModel = cardModel
    }
}
