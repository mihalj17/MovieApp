//
//  SearchView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct SearchView: View {
    var viewModel: SearchViewModel
    var body: some View {
        Text("SearchView")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: .init())
    }
}
