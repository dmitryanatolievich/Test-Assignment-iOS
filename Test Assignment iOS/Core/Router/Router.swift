//
//  Router.swift
//  Test Assignment iOS
//
//  Created by Dmitry Anatolievich on 25.05.2021.
//

import Foundation
import UIKit

protocol Router {
    func present(scene: Scene)
    func push(scene: Scene)
}

protocol Routable: AnyObject {
    var router: Router? { get set }
}

class MainRouter: Router {
    
    weak var rootVC: UIViewController?
    
    init(rootVC: UIViewController) {
        self.rootVC = rootVC
    }
    
    func present(scene: Scene) {
        guard let vc = scene.initiateVC else { return }
        configureWithRouter(viewController: vc)
        rootVC?.present(vc, animated: true, completion: nil)
    }
    
    func push(scene: Scene) {
        guard let vc = scene.initiateVC else { return }
        configureWithRouter(viewController: vc)
        rootVC?.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureWithRouter(viewController: UIViewController) {
        (viewController as? Routable)?.router = self
    }
}

