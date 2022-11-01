//
//  FavoriteMovieCard.swift
//  Cobe
//
//  Created by Matko Mihaljl on 31.10.2022..
//

import SwiftUI

struct FavoriteMovieCard: View {
    let favoriteMovie : MovieData.MovieDataItem
    @ObservedObject var viewModel =  FavoritesViewModel(PersistenceService: PersistanceService())
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
                    viewModel.toggleShow(favoriteMovie)
                    
                }
            Image(systemName: "heart.fill")
                .foregroundColor(.yellow)
        }
            
        }
    }
        .navigationBarHidden(true)
    }
}


