//
//  ScheduleMovieCardView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 26.10.2022..
//

import Foundation
import SwiftUI

struct ScheduleMovieCardView: View {
    
    var scheduleShow: ScheduleAPIResponse
    let dateFormatter = DateFormatter()
    
    var body: some View {
        VStack() {
            VStack{
                AsyncImage(url: scheduleShow.show.image?.medium) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray

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
