//
//  DetailsViewController.swift
//  Cobe
//
//  Created by Matko Mihaljl on 20.10.2022..
//



import Foundation
import SwiftUI

//class DetailsViewController: UIViewController {
//    
//    
//    var contentView = UIHostingController(rootView: DetailsView(viewModel: data))
//    var viewModel: DetailsViewModel
//
//    init(viewModel: DetailsViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addChild(contentView)
//
//        contentView.view.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(contentView.view)
//
//        NSLayoutConstraint.activate([
//            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
//
//            contentView.view.topAnchor.constraint(equalTo: view.topAnchor),
//            contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            contentView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            contentView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            contentView.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            contentView.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
//        ])
//    }
//}
