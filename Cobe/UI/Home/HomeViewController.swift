//
//  HomeViewController.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import SwiftUI

class HomeViewController: UIViewController {

    var contentView = UIHostingController(rootView: HomeView(viewModel: .init(getAllShows: ShowsAPIService())))
    var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(contentView)
        
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contentView.view)
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            contentView.view.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            contentView.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
}
