//
//  HomeView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct HomeView: View {
    var viewModel: HomeViewModel
    var body: some View {
        VStack{
            VStack{
                HStack(alignment: .bottom){
                    Text("SHOWS")
                        .foregroundColor(.gray)
                    Spacer()
                    Button("show all"){
                        
                    }
                    .foregroundColor(.yellow)
                    
                }
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack{
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 300)
                            
                        }
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
                    HStack{
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 300)
                            
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
        HomeView(viewModel: .init())
    }
}
