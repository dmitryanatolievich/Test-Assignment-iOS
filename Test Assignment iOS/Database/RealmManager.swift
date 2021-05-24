//
//  RealmManager.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//

import Foundation
import RealmSwift

class RealmManager {
    
    // MARK: Singleton
    
    static let shared = RealmManager()
    
    var realm = try? Realm()
    
    func writeObject(_ object: Object) {
        do {
            try realm?.write {
                realm?.add(object, update: .all)
            }
        } catch let realmWriteError {
            print(realmWriteError.localizedDescription)
        }
    }
    
    func writeObjects(_ object: [Object]) {
        try? realm?.write {
            realm?.add(object)
        }
    }
    
    func deleteObject(item: CardModelDB) {
        if let itemForDelete = realm?.objects(CardModelDB.self).filter("cardNumber IN %@", [item.cardNumber]) {
            try? realm?.write {
                realm?.delete(itemForDelete)
            }
        }
    }

    func readObjects<T>(type: T.Type) throws -> [T] where T: Object {
        guard let object = try? realm?.objects(type) else {
            throw ErrorResultRealm.notExistModel
        }
        guard !object.isEmpty else {
            throw ErrorResultRealm.notFoundElements
        }
        return Array(object)
    }
}
