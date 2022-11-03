//
//  MovieCardView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 26.10.2022..
//

import Foundation
import SwiftUI

struct MovieCardView: View {
    var show: ShowsAPIResponse
    @ObservedObject  var  viewModel = HomeViewModel<Any>(ShowsApiService: ShowsAPIService(),ScheduleApiService: ScheduleAPIService(), CastApiService: CastAPIService(), PersistenceService: PersistanceService())
    var body: some View {
        VStack() {
            ZStack(alignment: .topLeading){
            AsyncImage(url: show.image.medium) {  image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray
                
            }
                ZStack{
                Rectangle()
                    .frame(width: 30, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .background(Color("DarkGray"))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("LightGray"), lineWidth: 1)
                    }
                    
                    Button {
                        viewModel.toggleFavoriteShow(show)
                        viewModel.persistFavorite(viewModel.isFavoriteChecked)
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(viewModel.isMovieinFavoriteArray(show) ? Color.yellow : Color.gray)
                            .font(.title3)
                    }
                }
            
            }
            
            VStack() {
                HStack(alignment: .center, spacing: 4){
                 Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                
                    Text("\(show.rating.average ?? 5.0,specifier: "%.2f")")
                        .foregroundColor(.gray)
                      Spacer()
                }
                HStack(alignment: .center){
                Spacer()
                Text(show.name)
                    .tint(Color.white)
                    .padding(.trailing)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                Spacer()
                }
            }
            
        }
        .background(Color("DarkGray"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}
