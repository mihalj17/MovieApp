//
//  ShowDetailsView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 25.10.2022..
//

import Foundation
import SwiftUI
import AttributedText

struct ScheduleDetailsView: View {
    let schedule: ScheduleAPIResponse
    let scheduleCast: [CastAPIResponse]
    
    var body: some View {
        VStack{
            VStack{
                AsyncImage(url: schedule.show.image?.medium,scale: 1){ image in
                    image
                        .resizable()
                        .navigationBarHidden(true)
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    Color.gray
                }
                Spacer()
            }
            .ignoresSafeArea()
            .background(.black)
            Spacer()
            Spacer()
            VStack{
                AttributedText(schedule.show.summary ?? "no summary")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                    .lineLimit(4)

            }
            Spacer()
            VStack{
                HStack{
                    Text("Cast")
                        .foregroundColor(Color("LightGray"))
                    Spacer()
                    Button("show all"){
                    }
                    .foregroundColor(.yellow)
                    
                }
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 3){
                        ForEach(scheduleCast, id: \.person?.id){ person in
                            VStack{
                                AsyncImage(url: person.person?.image?.medium){ image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fill)
                                        
                                        
                                    
                                } placeholder: {
                                    Color.gray
                                }
                            }.frame(width: 100, height: 100)
                            
                        }
                            
                    

                    }
                })
                
            }
            Spacer()
            Spacer()
                
        }

        .background(.black)
        }
}


