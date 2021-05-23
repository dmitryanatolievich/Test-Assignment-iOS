//
//  MainVC.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 21.05.2021.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var cardsTableView: UITableView!
    
    var controller = MainController()
    var cardModel = [CardModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        cardsTableView.dataSource = self
        cardsTableView.delegate = self
        cardsTableView.register(cell: CardsTableCell.self)
        cardsTableView.backgroundColor = .white
        cardsTableView.tableFooterView = UIView()
    }
    
    @IBAction func addCardBtn(_ sender: Any) {
        controller.didTouchAddCard()
        cardsTableView.reloadData()
    }
}

