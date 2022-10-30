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
        let vm = HomeViewModel<Any>(ShowsApiService: ShowsAPIService(),ScheduleApiService: ScheduleAPIService(), CastApiService: CastAPIService(), PersistenceService: PersistanceService())
        let vc = UIHostingController(rootView: HomeView(viewModel: vm))
        vc.tabBarItem = tabBarItem
        
        
        vm.onGoToDetails = { [weak self] movie, cast  in
            self?.goToInfo(object: movie, cast: cast)
            
        }
        return vc
    }
    
    private func goToInfo<T>(object: T, cast: [CastAPIResponse]){
        
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController, data: object, cast: cast)
        childCoordinators.append(detailsCoordinator)
        let detailsViewController = detailsCoordinator.makeController()
        navigationController.pushViewController(detailsViewController, animated: true)
                
    }
   
}





