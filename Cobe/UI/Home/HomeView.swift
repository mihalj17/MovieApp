
import SwiftUI

struct HomeView: View {
    @ObservedObject  var  viewModel = HomeViewModel<Any>(ShowsApiService: ShowsAPIService(),ScheduleApiService: ScheduleAPIService(), CastApiService: CastAPIService())
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
                        ForEach(viewModel.movies,id: \.id) { show in
                            MovieCardView(show: show)
                                .onTapGesture {
                                    viewModel.getCastInfo(show.id)
                                    viewModel.onGoToDetails?(show,viewModel.cast)
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
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 3){
                        ForEach(viewModel.scheduleMovies,id: \.id) { scheduleShow in
                            ScheduleMovieCardView(scheduleShow: scheduleShow)
                                .onTapGesture {
                                    viewModel.getCastInfo(scheduleShow.show.id)
                                    viewModel.onGoToDetails?(scheduleShow,viewModel.cast)
                                }
                            
                        }
                    }
                    
                })
            }
            Spacer()
            Spacer()
        }
        .onAppear {
              if count < 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    viewModel.fetchShowInfo()
                    viewModel.fetchScheduleShowInfo()
                    viewModel.emptyCast()
                    count.self += 1
              }
              }
              else { return }
            }

        .background(.black)
        
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(ShowsApiService: ShowsAPIService(),ScheduleApiService: ScheduleAPIService(), CastApiService: CastAPIService()))
    }
}






