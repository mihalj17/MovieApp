//
//  DetailsView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 20.10.2022..
//

import SwiftUI
import AttributedText

struct DetailsView<T>: View {
    @ObservedObject var viewModel: DetailsViewModel<T>
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack{
                    if( (viewModel.data as? ShowsAPIResponse) != nil){
                        
                        ShowDetailsView(movie: viewModel.data as! ShowsAPIResponse, cast: viewModel.cast)
                    }
                    else{
                        ScheduleDetailsView(schedule: viewModel.data as! ScheduleAPIResponse, scheduleCast: viewModel.cast)
                    }
                }
                VStack{
                    HStack{
                        ZStack {
                            Button{
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                Text("back")
                            }
                            .font(.system(.headline))
                            .font(.footnote.weight(.heavy))
                            .foregroundColor(.white)
                        }
                        Spacer()
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(.gray)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                                .frame(width: 40, height: 40)
                            
                            Button {
                                // add show to Favorites
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.gray)
                                    .font(.title3)
                            }
                        }
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .background(.black)
    }
    
}


