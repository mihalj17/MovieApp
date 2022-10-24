//
//  HomeCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import UIKit
import SwiftUI




class HomeCoordinator: Coordinator{
    
    var childCoordinator: Coordinator?
    
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
        let vm = HomeViewModel<Any>(getAllShows: ShowsAPIService(),getScheduleShows: ScheduleAPIService())
        let vc = UIHostingController(rootView: HomeView(viewModel: vm))
        vc.tabBarItem = tabBarItem
        
        
        vm.onGoToDetails = { [weak self] movie  in
            self?.goToInfo(object: movie)
            
        }
        return vc
    }
    
    private func goToInfo<T>(object: T){
        
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController, data: object)
        childCoordinators.append(detailsCoordinator)
        let detailsViewController = detailsCoordinator.makeController()
        navigationController.pushViewController(detailsViewController, animated: true)
                
    }
   
}





