//
//  FavoritesView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FavoritesViewModel
    var body: some View {
        VStack{
                ZStack{
                    Color.black
                        .ignoresSafeArea()
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
                            ForEach(viewModel.favoritedMovies, id: \.id){ filteredMovie in
                                FavoriteMovieCard(favoriteMovie: filteredMovie)
                                
                            }
                        }
                    }
                    
                    .onAppear {
                        viewModel.load()
                    }
                    
                }
                
                
            
            
        }
        .navigationBarHidden(true)
    }
        
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: .init(PersistenceService: PersistanceService()))
    }
}
