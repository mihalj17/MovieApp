//
//  SearchCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import UIKit
import SwiftUI



final class SearchCoordinator: Coordinator {
    
//    private var navigationController = UINavigationController()
    
    var childCoordinator: Coordinator?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        return makeSearchViewController()
    }
    
    private func makeSearchViewController() -> UIViewController {
        let vm = SearchViewModel(searchApiService: SearchAPIService(), castAPIService: CastAPIService(),showsAPIResponse: ShowsAPIResponse.defaultData)
        let vc = UIHostingController(rootView: SearchView(viewModel: vm))
        vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
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
