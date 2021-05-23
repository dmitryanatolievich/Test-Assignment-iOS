//
//  String.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation

extension String {
    
    func randomString(length: Int = 14) -> String {
        let letters = "0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
    func maskedCardNumber() -> String {
        let mask = "**** **** **** " + self.suffix(4)
        return mask
    }
    
}
