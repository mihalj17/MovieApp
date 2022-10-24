//
//  DetailsView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 20.10.2022..
//

import SwiftUI

struct DetailsView<T>: View {
    @ObservedObject var viewModel: DetailsViewModel<T>
    var body: some View {
        if( (viewModel.data as? ShowsAPIResponse) != nil){
            FirstSlider()
        }
        else{
            SecondSLider()
        }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(viewModel: .init(data:  ))
//    }
//}



struct FirstSlider: View {
    
    var body: some View {
        Text("Firstslider")

    }
}

struct SecondSLider: View {
    
    var body: some View {
        Text("SEcondSlider")

    }
}
