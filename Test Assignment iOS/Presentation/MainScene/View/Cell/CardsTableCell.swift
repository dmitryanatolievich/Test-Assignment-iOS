//
//  CardsTableCell.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import UIKit

final class CardsTableCell: UITableViewCell {
    
    @IBOutlet weak var paymentSystemLogo: UIImageView!
    @IBOutlet weak var cardNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupContent(for model: CardModel) {
        paymentSystemLogo.image = model.image
        cardNumber.text = model.cardNumber.maskedCardNumber()
    }
}
