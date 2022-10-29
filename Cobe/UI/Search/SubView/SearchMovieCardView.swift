//
//  SearchMovieCardView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 26.10.2022..
//

import Foundation
import SwiftUI

struct SearchMovieCardView: View {
    var searchMovie: SearchAPIResponse
    var body: some View {
        VStack{
            HStack{
                VStack{
                    AsyncImage(url: searchMovie.show.image.medium) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        Color.gray
                        
                    }
                }.frame(width: 100, height: 100)
                VStack{
                    HStack{
                        Text(searchMovie.show.name)
                            .font(.custom("FontName",fixedSize: 20))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Text(searchMovie.show.premiered)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        ForEach(searchMovie.show.genres,id: \.self){genres in
                            Text(genres)
                                .foregroundColor(.gray)
                        }
                            
                        Spacer()
                    }
                    
                }
                
                Spacer()
            }
            
        }
        
    }
}
