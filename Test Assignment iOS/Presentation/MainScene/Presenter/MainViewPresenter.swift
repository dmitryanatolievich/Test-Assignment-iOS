//
//  MainViewpresenter.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 24.05.2021.
//

import Foundation

protocol MainViewPresenterInput {
    func viewDidLoad()
    func addCard()
    func didSelectCard(at index: Int)
}

protocol MoainViewPresenterOutput {
    func numberOfRows() -> Int
    func dataForItem(at indexPath: Int) -> CardModel
    init(view: MainPresenterView)
}

protocol MainViewPresenterProtocol: MainViewPresenterInput, MoainViewPresenterOutput {}

class MainViewPresenter: MainViewPresenterProtocol {
    
    private weak var view: MainPresenterView?
    private let dataBase = RealmManager.shared
    
    private var model: [CardModel] = [] {
        didSet {
            view?.itsTimeToUpdate()
        }
    }
    
    // MARK: - Private
    
    private func createRandomCard() -> PaymentSystem {
        let arr: [PaymentSystem] = PaymentSystem.allCases
        let index = Int.random(in: 0..<arr.count)
        return arr[index]
    }
    
    private func appendCard() {
        let card = CardModel(paymentSystem: createRandomCard())
        model.append(card)
        dataBase.writeObject(CardModelDB(card))
    }
    
    // MARK: - Input
    func viewDidLoad() {
        if let data = try? dataBase.readObjects(type: CardModelDB.self) {
            model = data.map{CardModel(cardModel: $0 )}.sorted(by: {$0.date < $1.date})
        }
    }
    
    func addCard() {
        appendCard()
    }
    
    func didSelectCard(at index: Int) {
        let cardsDetailsController = CardsDetailsController()
        cardsDetailsController.cardModel = model[index]
        cardsDetailsController.initVC()
    }
    
    // MARK: - Init // Output
    
    func numberOfRows() -> Int {
        return model.count
    }
    
    func dataForItem(at indexPath: Int) -> CardModel {
        return model[indexPath]
    }
    
    required init(view: MainPresenterView) {
        self.view = view
    }
}
