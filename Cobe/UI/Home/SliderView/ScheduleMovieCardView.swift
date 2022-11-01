//
//  ScheduleMovieCardView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 26.10.2022..
//

import Foundation
import SwiftUI

struct ScheduleMovieCardView: View {
    @ObservedObject  var  viewModel = HomeViewModel<Any>(ShowsApiService: ShowsAPIService(),ScheduleApiService: ScheduleAPIService(), CastApiService: CastAPIService(), PersistenceService: PersistanceService())
    var scheduleShow: ScheduleAPIResponse
    let dateFormatter = DateFormatter()
    var body: some View {
        VStack{
            
            ZStack(alignment: .topLeading){
                
                AsyncImage(url: scheduleShow.show.image?.medium) { image in
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
                        .onTapGesture{
                            viewModel.toggleFavScheduleShow(scheduleShow)
                        }
                    
                    if viewModel.isFavorite {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName:"heart" )
                            .foregroundColor(Color("LightGray"))
                        
                    }
                }
                
            }
            VStack(){
                HStack{
                    Text(scheduleShow.airdate)
                        .foregroundColor(.gray)
                    Text(scheduleShow.airtime)
                        .foregroundColor(.gray)
                }
                Text(scheduleShow.show.name)
                    .foregroundColor(.gray)
                
                
            }
            
            
        }
        .background(Color("DarkGray"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
    
}
