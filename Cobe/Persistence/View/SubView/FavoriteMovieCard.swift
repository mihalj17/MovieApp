//
//  FavoriteMovieCard.swift
//  Cobe
//
//  Created by Matko Mihaljl on 31.10.2022..
//

import SwiftUI

struct FavoriteMovieCard: View {
    let favoriteMovie : FavoriteMovieData.Favorite
    @ObservedObject var viewModel =  FavoritesViewModel(PersistenceService: PersistanceService(),castAPIService: CastAPIService(),showsAPIResponse: ShowsAPIResponse.defaultData)
    var body: some View {
        VStack{
        ZStack(alignment: .topLeading){
            VStack{
                AsyncImage(url: favoriteMovie.imageMovie) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray

            }
            }.clipShape(RoundedRectangle(cornerRadius: 5))
                
            ZStack{
            Rectangle()
                .frame(width: 30, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .background(Color("DarkGray"))
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("LightGray"), lineWidth: 1)
                }
                .onTapGesture {
                    viewModel.toggleFavorite(favoriteMovie)
                    viewModel.persistFavorite(viewModel.isMovieSaved)
                    
                }
                
                if viewModel.checkFavoriteMovie(favoriteMovie){
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName:"heart" )
                        .foregroundColor(Color("LightGray"))
                    
                }
        }
            
        }
    }
        .navigationBarHidden(true)
    }
}


