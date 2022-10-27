//
//  SearchView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct SearchView: View {
    @ObservedObject  var  viewModel = SearchViewModel(getSearchMovie: SearchAPIService())
    @State private var searchString = ""
    var body: some View {
        ZStack{
            VStack {
                ScrollView {
                    ForEach(viewModel.searchedMovies, id: \.show.id) { show in
                        SearchMovieCardView(searchMovie: show)
                    }
                }
            }
        }
        .padding(.top,8)
        .padding(.bottom,10)
        .background(.black)
        .searchable(text: $searchString)
        .onChange(of: self.searchString, perform: { query in
            
            if query != "" {
            self.viewModel.getSearchMovie(query)
            }
            else {
                viewModel.emptySearchedCast()
            }
            
        })
        
        
        
        .onAppear {
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
        SearchView(viewModel: .init(getSearchMovie: SearchAPIService()))
    }
}



