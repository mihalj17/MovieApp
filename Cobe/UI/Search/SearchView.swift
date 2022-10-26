//
//  SearchView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct SearchView: View {
    @ObservedObject  var  viewModel = SearchViewModel(getAllShows: ShowsAPIService())
    @State private var searchString = ""
    var body: some View {
        ZStack{
            VStack {
                ScrollView {
                    ForEach(viewModel.movies) { movie in
                        
                        SearchMovieCardView(show: movie)
                        
                    }
                }
            }
        }
        .padding(.top,8)
        .padding(.bottom,10)
        .searchable(text: $searchString)
        .preferredColorScheme(.light)
        .background(.black)
        
        
        
        .onAppear {
            viewModel.fetchShow()
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = .black
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
            
        }
        
        
    }
}





struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: .init(getAllShows: ShowsAPIService()))
    }
}



