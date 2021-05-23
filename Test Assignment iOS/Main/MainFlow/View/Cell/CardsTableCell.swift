//
//  CardsTableCell.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import UIKit

class CardsTableCell: UITableViewCell {
    @IBOutlet weak var paymentSystemLogo: UIImageView!
    @IBOutlet weak var cardNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var model: CardModel? {
        didSet {
            guard let model = model else { return }
            setupContent(for: model)
        }
    }
    
    private func setupContent(for model: CardModel) {
        cardNumber.text = model.id
        if model.isVisa == true {
            paymentSystemLogo.image = R.image.visa()
        } else {
            paymentSystemLogo.image = R.image.mastercard()
        }
    }
}
