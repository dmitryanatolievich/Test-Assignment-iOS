//
//  DetailsViewPresenter.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 24.05.2021.
//

import Foundation

protocol DetailsViewPresenterInput {
    func turnCard()
}

protocol DetailsViewPresenterOutput {
    var cardModel: CardModel { get set }
    init(view: DetailsPresenterView, cardModel: CardModel)
}

protocol DetailsViewPresenterProtocol: DetailsViewPresenterInput, DetailsViewPresenterOutput {}

class DetailsViewPresenter: DetailsViewPresenterProtocol {
    
    var cardModel: CardModel
    private var workItem: DispatchWorkItem?
    private let timeInterval: TimeInterval = 3.0
    private weak var view: DetailsPresenterView?
    private var cardState: CardState = .normal {
        didSet {
            view?.updateState(cardState)
            cardState == .normal ? cancelItem() : addWorkItem()
        }
    }
    
    required init(view: DetailsPresenterView, cardModel: CardModel) {
        self.view = view
        self.cardModel = cardModel
    }
    
    // MARK: - Internal
    func turnCard() {
        cardState = cardState == .normal ? .turned : .normal
    }
    
    // MARK: - Private
    private func addWorkItem() {
        workItem = DispatchWorkItem { [weak self] in
            self?.cardState = .normal
        }
        guard let workItem = workItem else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval,
                                      execute: workItem)
    }
    
    private func cancelItem() {
        workItem?.cancel()
        workItem = nil
    }
    
}
