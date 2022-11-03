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

    private var navigationController = UINavigationController()
    
    func start() -> UIViewController {
        return makeFavoriteViewController()
    }
    
    private func makeFavoriteViewController() -> UIViewController {
        let vm = FavoritesViewModel(PersistenceService: PersistanceService())
        let vc = UIHostingController(rootView: FavoritesView(viewModel: vm))
        vc.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
}
