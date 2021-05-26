//
//  MainViewController.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 24.05.2021.
//

import UIKit

protocol MainPresenterView: AnyObject {
    func update()
    func push(scene: Scene)
}

class MainViewController: UIViewController, Routable {
    
    private var presenter: MainViewPresenterProtocol!
    internal var router: Router?
    
    @IBOutlet private weak var cardsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainViewPresenter(view: self)
        presenter.viewDidLoad()
        self.router = MainRouter(rootVC: self)
        navigationController?.navigationBar.barTintColor = .white
        configureTableView()
    }
    
    private func configureTableView() {
        cardsTableView.dataSource = self
        cardsTableView.delegate = self
        cardsTableView.register(cell: CardsTableCell.self)
        cardsTableView.backgroundColor = .white
        cardsTableView.tableFooterView = UIView()
    }
    
    @IBAction private func addButtonDidTap(_ sender: Any) {
        presenter.addCard()
    }
}

// MARK: - Extensions

extension MainViewController: MainPresenterView {
    
    func push(scene: Scene) {
        router?.push(scene: scene)
    }
    
    func update() {
        cardsTableView.reloadData()
    }
}

// MARK: - TableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CardsTableCell.identifier, for: indexPath) as? CardsTableCell {
            let model = presenter.dataForItem(at: indexPath.row)
            cell.setupContent(for: model)
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - TableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCard(at: indexPath.row)
    }
}
