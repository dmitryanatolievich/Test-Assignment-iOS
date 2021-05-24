//
//  UITableView+CellManage.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import UIKit

// MARK: - UITableView + CellManage

extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }
}
