//
//  HomeView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct HomeView: View {
    var viewModel: HomeViewModel
    var body: some View {
        Text("HomeView")
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init())
    }
}
