//
//  FavoritesCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//


import Foundation
import UIKit
import SwiftUI



final class FavoritesCoordinator: Coordinator {
    
    var childCoordinator: Coordinator?
    var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        return makeFavoriteViewController()
    }
    
    private func makeFavoriteViewController() -> UIViewController {
        let vm = FavoritesViewModel(PersistenceService: PersistanceService(), castAPIService: CastAPIService(), showsAPIResponse: ShowsAPIResponse.defaultData)
        let vc = UIHostingController(rootView: FavoritesView(viewModel: vm))
        vc.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        navigationController?.pushViewController(vc, animated: true)
        
        vm.onGoToDetails = { [weak self] movie, cast in
            self?.goToInfo(object: movie, cast: cast)
        }
        
        return vc
    }
    
    
    private func goToInfo(object: ShowsAPIResponse, cast: [CastAPIResponse]){

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
