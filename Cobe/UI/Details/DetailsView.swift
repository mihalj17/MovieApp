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
        if( (viewModel.data as? ShowsAPIResponse) != nil){
            
            FirstSlider(movie: viewModel.data as! ShowsAPIResponse)
            
        }
        else{
            SecondSLider(movie: viewModel.data as! ScheduleAPIResponse)
        }
            }
            
        }
        .hideNavigationBar()
        
        
    }
        
        
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(viewModel: .init(data:  ))
//    }
//}
extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}


struct FirstSlider: View {
    let movie: ShowsAPIResponse
    var body: some View {
        VStack{
            VStack(){
                AsyncImage(url: movie.image.medium){ image in
                    image.resizable().aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    Color.gray
                }
            }
            VStack{
                AttributedText(movie.summary)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                    .lineLimit(3)
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
                        ForEach(0..<5) {_ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 100, height: 100)
                    }
                    }
                    
                    
                    
                })
            }
            
            
        }
        .background(.black)
        
    }
        
}





struct SecondSLider: View {
    let movie: ScheduleAPIResponse
    var body: some View {
        VStack{
            VStack{
                
            }
            VStack{
                
            }
            VStack{
                HStack{
                    
                }
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 3){
                        ForEach(0..<50) {_ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 200, height: 200)
                    }
                    }
                    
                    
                    
                })
            }
        }

    }
}
