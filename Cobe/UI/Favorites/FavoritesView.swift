//
//  FavoritesView.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FavoritesViewModel
    var body: some View {
        VStack{
            Text("matko")
            }
        }
        
    }
    


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: .init(persistenceService: PersistanceService()))
    }
}
