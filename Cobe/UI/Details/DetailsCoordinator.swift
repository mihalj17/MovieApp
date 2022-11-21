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
    
    var onDismissed: (()-> Void)?
    let data: T
    let cast: [CastAPIResponse]
    
    init(data: T, cast: [CastAPIResponse]) {
        self.data = data
        self.cast = cast
    }
    
    func start() -> UIViewController {
        let vm = DetailsViewModel<T>(data: data, cast: cast)
        let vc = UIHostingController(rootView: DetailsView<T>(viewModel: vm))
        
        vm.onDismissed = { [weak self] in
            self?.onDismissed?()
        }
        
        return vc
        
    }
}











