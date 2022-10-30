//
//  FavoritesCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//


import Foundation
import UIKit
import SwiftUI



class FavoritesCoordinator: Coordinator {
    
    private var navigationController: UINavigationController!
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    init(tabBarItem: UITabBarItem) {
        super.init()
        setupRootViewController(with: makeViewController(with: tabBarItem))
        
    }
    private func setupRootViewController(with viewController: UIViewController){
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.delegate = self
    }
    
    private func makeViewController(with tabBarItem: UITabBarItem) -> UIViewController {
        let vm = FavoritesViewModel(persistenceService: PersistanceService())
        let vc = UIHostingController(rootView: FavoritesView(viewModel: vm))
        vc.tabBarItem = tabBarItem
        return vc
    }
    
     override func start() {
        
    }
    
    
}
