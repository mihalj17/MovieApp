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
    var body: some View {
        VStack() {
            VStack{
            AsyncImage(url: show.image.medium) {  image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray
                
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
