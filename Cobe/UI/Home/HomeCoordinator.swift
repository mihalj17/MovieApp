//
//  HomeCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import UIKit
import SwiftUI




 final class HomeCoordinator: Coordinator{
    
    var childCoordinator: Coordinator?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        return makeHomeViewController()
    }
    private func makeHomeViewController() -> UIViewController {
        let vm = HomeViewModel<Any>(ShowsApiService: ShowsAPIService(),ScheduleApiService: ScheduleAPIService(), CastApiService: CastAPIService(), PersistenceService: PersistanceService())
        let vc = UIHostingController(rootView: HomeView(viewModel: vm))
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))


        vm.onGoToDetails = { [weak self] movie, cast  in
            self?.goToInfo(object: movie, cast: cast)

        }
        return vc
    }
//
    private func goToInfo<T>(object: T, cast: [CastAPIResponse]){

        let detailsCoordinator = DetailsCoordinator(data: object, cast: cast)
        childCoordinator = detailsCoordinator
        
        detailsCoordinator.onDismissed = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            self?.childCoordinator = nil
        }
        
        let detailsViewController = detailsCoordinator.start()
        self.navigationController?.pushViewController(detailsViewController, animated: true)

    }
   
}





