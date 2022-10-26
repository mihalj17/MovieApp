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
    let cast: [CastAPIResponse]
    init(navigationController: UINavigationController, data: T, cast: [CastAPIResponse]) {
        self.navigationController = navigationController
        self.data = data
        self.cast = cast
    }
    
     func makeController() -> UIViewController {
         let vm = DetailsViewModel<T>(data: data, cast: cast)
        let vc = UIHostingController(rootView: DetailsView(viewModel: vm))
        return vc
        
    }
}




 

    
   
    
    

