//
//  HomeView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct HomeView: View {
    @ObservedObject  var  viewModel = HomeViewModel(getAllShows: ShowsAPIService())
    var body: some View {
        VStack{
            VStack{
                HStack(alignment: .bottom){
                    Text("SHOWS")
                        .foregroundColor(.gray)
                    Spacer()
                    Button("show all"){
                        viewModel.show()
                    }
                    .foregroundColor(.yellow)
                    
                }
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 3){
                        ForEach(viewModel.movies,id: \.id) { show in
                            MovieCardView(show: show)
                            
                        }
//
                    }
                })
            }
            VStack{
                HStack(alignment: .bottom){
                    Text("SCHEDULE")
                        .foregroundColor(.gray)
                    Spacer()
                    Button("show all"){
                        
                    }
                    .foregroundColor(.yellow)
                    
                }
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 3){
                        ForEach(viewModel.movies,id: \.id) { show in
                            MovieCardView(show: show)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(getAllShows: ShowsAPIService()))
    }
}


struct MovieCardView: View {
    var show: ShowsAPIResponse
    let darkGray = UIColor.init(named: "1c1b1b")
    var body: some View {
        VStack() {
            VStack{
            AsyncImage(url: show.image.medium) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray
                    .padding()
            }
            .frame(width: .infinity, height: .infinity)
            
            }
            
            VStack() {
                HStack(alignment: .center, spacing: .leastNormalMagnitude){
                 Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                
                    Text("\(show.rating.average ?? 5.0)")
                        .foregroundColor(.white)
                      Spacer()
                }
                HStack(){
                Text(show.name)
                    .tint(Color.white)
                    .padding(.trailing)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                Spacer()
                }
            }
            .background()
        }
        
        
    }
}

