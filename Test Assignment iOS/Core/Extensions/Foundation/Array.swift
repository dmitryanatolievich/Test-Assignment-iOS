//
//  Array.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation

extension Array {
    
    // MARK: - Safely lookup an index that might be out of bounds returning nil if it does not exist
    
    func get(index: Int) -> Element? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}
