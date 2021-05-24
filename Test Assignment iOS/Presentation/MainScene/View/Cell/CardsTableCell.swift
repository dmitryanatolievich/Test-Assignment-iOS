//
//  CardsTableCell.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import UIKit

final class CardsTableCell: UITableViewCell {
    
    @IBOutlet private weak var paymentSystemLogo: UIImageView!
    @IBOutlet private weak var cardNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Setup cell content from model

 extension CardsTableCell {
    func setupContent(for model: CardModel) {
        paymentSystemLogo.image = model.image
        cardNumber.text = model.cardNumber.maskedCardNumber()
    }
}
