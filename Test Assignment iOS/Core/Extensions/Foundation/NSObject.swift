//
//  NSObject.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 23.05.2021.
//
import Foundation
import UIKit

extension NSObject {
    func pushVC(_ vc: UIViewController) {
        if let rootNavVC = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            rootNavVC.pushViewController(vc, animated: true)
        }
    }
    
    func popVC() {
        if let rootNavVC = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            rootNavVC.popViewController(animated: true)
        }
    }
}
