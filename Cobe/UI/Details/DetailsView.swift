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
                    
                    let _ =  print("miran 2")
                    ShowDetailsView(movie: viewModel.data as! ShowsAPIResponse, cast: viewModel.cast)
                    
                }
                else{
                    let _ =  print("matko 2")
                    ScheduleDetailsView(schedule: viewModel.data as! ScheduleAPIResponse, scheduleCast: viewModel.cast)
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

