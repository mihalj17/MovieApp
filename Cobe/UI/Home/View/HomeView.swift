
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel<Any>(ShowsApiService: ShowsAPIService(),ScheduleApiService: ScheduleAPIService(), CastApiService: CastAPIService(), PersistenceService: PersistanceService())
    @State var count = 0
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
                    HStack(spacing: 3){
                        ForEach(viewModel.movies.prefix(11),id: \.id) { show in
                            ZStack(alignment: .topLeading){
                                MovieCardView(show: show)
                                    .onTapGesture {
                                        viewModel.getCastInfo(show.id)
                                        viewModel.onGoToDetails?(show,viewModel.cast)
                                    }
                            }
                            
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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 3){
                        ForEach(viewModel.scheduleMovies.prefix(11),id: \.id) { scheduleShow in
                            ZStack(alignment: .topLeading){
                                ScheduleMovieCardView(scheduleShow: scheduleShow)
                                    .onTapGesture {
                                        viewModel.getCastInfo(scheduleShow.show.id)
                                        viewModel.onGoToDetails?(scheduleShow,viewModel.cast)
                                    }
                            }
                        }
                    }
                    
                }
                
            }
            Spacer()
            Spacer()
        }
        .navigationBarHidden(true)
        .onAppear()
        {
            viewModel.fetchShowInfo()
            viewModel.fetchScheduleShowInfo()
            viewModel.emptyCastArray()
        }
        .background(.black)
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(ShowsApiService: ShowsAPIService(),ScheduleApiService: ScheduleAPIService(), CastApiService: CastAPIService(), PersistenceService: PersistanceService()))
    }
}






