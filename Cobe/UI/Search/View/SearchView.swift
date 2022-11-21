//
//  SearchView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct SearchView: View {
    @ObservedObject  var  viewModel = SearchViewModel(searchApiService: SearchAPIService(),castAPIService: CastAPIService(), showsAPIResponse: ShowsAPIResponse.defaultData)
    @State private var searchString = ""
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Color.black
                    Image("JokerImage")
                        .resizable()
                        .scaledToFit()
                    VStack {
                        HStack {
                            TextField("Search shows", text: $searchString)
                            
                                .padding(.horizontal, 40)
                                .frame(height: 45, alignment: .leading)
                                .background(Color("LightGray"))
                                .foregroundColor(.white)
                                .clipped()
                                .cornerRadius(10)
                                .overlay {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 16)
                                    
                                }
                        }
                        
                        ScrollView {
                            ForEach(viewModel.searchedMovies, id: \.show.id) { show in
                                SearchMovieCardView(searchMovie: show)
                                    .onTapGesture {
                                        viewModel.getActorsData(viewModel.createShows(show).id)
                                        viewModel.onGoToDetails?(viewModel.createShows(show), viewModel.actors)
                                        
                                    }
                            }
                            
                        }
                    }
                }
                .padding(.bottom,10)
                .background(.black)
                .searchable(text: $searchString)
                .foregroundColor(.white)
                .onChange(of: self.searchString, perform: { query in
                    
                    if query != "" {
                        self.viewModel.getSearchMovie(query)
                    }
                    else {
                        viewModel.emptySearchedCast()
                    }
                    
                })
            }
            .navigationBarHidden(true)
        }
        
    }
}




