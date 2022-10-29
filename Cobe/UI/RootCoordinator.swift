//
//  RootCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import UIKit


class RootCoordinator: Coordinator {
    var rootViewController: UIViewController{
        return tabBarController
    }
    
    private let tabBarController = UITabBarController()
    
    override init() {
        super.init()
        setup()
    }
    
    func setup(){
        setupTabBarController()
        setupCoordinators()
    }
    
    func setupTabBarController(){
        tabBarController.tabBar.tintColor = .yellow
        tabBarController.tabBar.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1.00)
        tabBarController.tabBar.barTintColor = .lightGray
        
        
        
    }
    func setupCoordinators(){
        let homeCoordinator = makeHomeCoordinator()
        let searchCoordinator = makeSearchCoordinator()
        let favoritesCooordinator = makeFavoritesCoordinator()
        
        
        
        
        tabBarController.viewControllers = [
            homeCoordinator.rootViewController,
            searchCoordinator.rootViewController,
            favoritesCooordinator.rootViewController,
            
        ]
        
        childCoordinators.append(homeCoordinator)
        childCoordinators.append(searchCoordinator)
        childCoordinators.append(favoritesCooordinator)
        
        
        
        
    }
    
    func makeHomeCoordinator() -> HomeCoordinator {
        return HomeCoordinator(tabBarItem: UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill")))
    }
    
    func makeSearchCoordinator() -> SearchCoordinator{
        return SearchCoordinator(tabBarItem: UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyglass.fill")))
    }
    
    func makeFavoritesCoordinator() -> FavoritesCoordinator{
        return FavoritesCoordinator(tabBarItem: UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill")))
    }
    
    
    
    override func start() {
        childCoordinators.forEach{  (childCoordinators) in
            childCoordinators.start()
            
        }
    }
}

