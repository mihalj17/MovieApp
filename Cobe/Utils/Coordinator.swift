//
//  Coordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//


import Foundation
import UIKit

class Coordinator: NSObject, UINavigationControllerDelegate{
    
    
    // MARK: - Properties
    
    var didFinish: ((Coordinator) -> Void)?
    
    // MARK: -
    
    var childCoordinators: [Coordinator] = []

    // MARK: - Methods
    
    func start() {}
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func pushCoordinator(_ coordinator: Coordinator){
        
        coordinator.didFinish = { [weak self] (coordinator) in
            self?.popCoordinator(coordinator)
            
        }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func popCoordinator(_ coordinator: Coordinator) {
        // Remove Coordinator From Child Coordinators
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}

