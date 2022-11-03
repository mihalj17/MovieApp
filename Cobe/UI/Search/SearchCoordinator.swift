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
    
    private var navigationController = UINavigationController()

    func start() -> UIViewController {
        return makeSearchViewController()
    }
    
    private func makeSearchViewController() -> UIViewController {
        let vm = SearchViewModel(getSearchMovie: SearchAPIService())
        let vc = UIHostingController(rootView: SearchView(viewModel: vm))
        vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
    
    
    
    
}
