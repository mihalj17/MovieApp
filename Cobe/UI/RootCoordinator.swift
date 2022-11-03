//
//  RootCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import UIKit


class RootCoordinator: Coordinator {
    
    
    
    var navigationController = UINavigationController()
    private var tabBarController = UITabBarController()
    var childCoordinators = [Coordinator]()
    
    func start() -> UIViewController {
        return TabBar()
    }
    
    func TabBar() -> UINavigationController{
        childCoordinators = [
            HomeCoordinator(navigationController: navigationController),
            SearchCoordinator(),
            FavoritesCoordinator()
        ]
        setup()
        navigationController.viewControllers = [tabBarController]
        return navigationController
    }
        func setup(){
            setupTabBarController()
        }
    
    func setupTabBarController(){
        tabBarController = UITabBarController()
        let TabAppearance = UITabBarAppearance()
        TabAppearance.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = TabAppearance
        
        tabBarController.tabBar.tintColor = .yellow
        tabBarController.tabBar.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1.00)
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.viewControllers = childCoordinators.map { coordinator in
            coordinator.start()
        }
    }
    
    }
    


