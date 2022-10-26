//
//  ShowDetailsView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 25.10.2022..
//

import Foundation
import SwiftUI
import AttributedText

struct ShowDetailsView: View {
    let movie: ShowsAPIResponse
    let cast: [CastAPIResponse]
    
    var body: some View {
        
        VStack{
            VStack{
                AsyncImage(url: movie.image.medium,scale: 1){ image in
                    image
                        .resizable()
                        .navigationBarHidden(true)
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    Color.gray
                }
                Spacer()
            }
            .background(.black)
            Spacer()
            VStack{
                AttributedText(movie.summary)
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
                    HStack(spacing: 2){
                        ForEach(cast, id: \.person?.id){ person in
                            
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

