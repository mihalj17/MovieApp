//
//  FavoritesView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct FavoritesView: View {
    var viewModel: FavoritesViewModel
    var body: some View {
        Text("FavoritesView")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: .init())
    }
}
