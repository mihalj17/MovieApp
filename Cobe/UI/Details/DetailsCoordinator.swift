//
//  DetailsCoordinator.swift
//  Cobe
//
//  Created by Matko Mihaljl on 20.10.2022..
//


import Foundation
import UIKit
import SwiftUI



final class DetailsCoordinator<T>: Coordinator {
    
    let navigationController: UINavigationController
    let data: T
    init(navigationController: UINavigationController, data: T) {
        self.navigationController = navigationController
        self.data = data
    }
    
     func makeController() -> UIViewController {
         let vm = DetailsViewModel<T>(data: data)
        let vc = UIHostingController(rootView: DetailsView(viewModel: vm))
        return vc
        
    }
}




 

    
   
    
    

