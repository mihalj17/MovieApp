//
//  SearchCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import UIKit
import SwiftUI



class SearchCoordinator: Coordinator {
    
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
        let vm = SearchViewModel(getAllShows: ShowsAPIService())
        let vc = UIHostingController(rootView: SearchView(viewModel: vm))
        vc.tabBarItem = tabBarItem
        return vc
    }
    
    override func start() {
        
    }
    
    
}
