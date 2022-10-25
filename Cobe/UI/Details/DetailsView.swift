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
    var body: some View {
        NavigationView{
            VStack{
            VStack{
                if( (viewModel.data as? ShowsAPIResponse) != nil){
                    
                    FirstSlider(movie: viewModel.data as! ShowsAPIResponse)
                    
                    
                }
                else{
                    SecondSLider(movie: viewModel.data as! ScheduleAPIResponse)
                }
                
                
            }
            
            }.edgesIgnoringSafeArea(.all)
        }
        .background(.black)
    }

}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(viewModel: .init(data:  ))
//    }
//}



struct FirstSlider: View {
    let movie: ShowsAPIResponse
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
                HStack(alignment: .bottom){
                    Text("Cast")
                        .foregroundColor(Color("LightGray"))
                    Spacer()
                    Button("show all"){
                        
                    }
                    .foregroundColor(.yellow)
                    
                }
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 3){
                        ForEach(0..<10) {_ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 100, height: 100)
                            
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





struct SecondSLider: View {
    let movie: ScheduleAPIResponse
    var body: some View {
        VStack{
            VStack{
                AsyncImage(url: movie.show.image?.medium,scale: 1){ image in
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
                AttributedText(movie.show.summary ?? "nil")
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
                        ForEach(0..<10) {_ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 100, height: 100)
                            
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
