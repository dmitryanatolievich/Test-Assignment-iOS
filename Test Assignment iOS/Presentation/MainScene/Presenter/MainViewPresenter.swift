//
//  MainViewPresenter.swift
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

protocol MainViewPresenterOutput {
    func numberOfRows() -> Int
    func dataForItem(at indexPath: Int) -> CardModel
    init(view: MainPresenterView)
}

protocol MainViewPresenterProtocol: MainViewPresenterInput, MainViewPresenterOutput {}

class MainViewPresenter: MainViewPresenterProtocol {
    
    // MARK: - Private
    
    private let dataBase = RealmManager.shared
    private weak var view: MainPresenterView?
    
    private var model: [CardModel] = [] {
        didSet {
            view?.update()
        }
    }
    
    private func createRandomCard() -> PaymentSystem {
        let arr: [PaymentSystem] = PaymentSystem.allCases
        let index = Int.random(in: 0..<arr.count)
        return arr[index]
    }
    
    private func appendCard() {
        let card = CardModel(paymentSystem: createRandomCard())
        model.insert(card, at: 0)
        dataBase.writeObject(CardModelDB(card))
    }
    
    // MARK: - Input
    
    func viewDidLoad() {
        if let data = try? dataBase.readObjects(type: CardModelDB.self) {
            model = data.map{CardModel(cardModel: $0 )}.sorted(by: {$1.date < $0.date})
        }
    }
    
    func addCard() {
        appendCard()
    }
    
    func didSelectCard(at index: Int) {
        view?.push(scene: .details(model[index]))
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
