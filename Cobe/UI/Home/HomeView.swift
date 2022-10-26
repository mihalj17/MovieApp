
import SwiftUI

struct HomeView: View {
    @ObservedObject  var  viewModel = HomeViewModel<Any>(getAllShows: ShowsAPIService(),getScheduleShows: ScheduleAPIService(), getCast: CastAPIService())
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
                                    viewModel.getCast(show.id)
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
                                    let _ = print("id od schedule \(scheduleShow.id)")
                                    viewModel.getCast(scheduleShow.show.id)
                                    viewModel.onGoToDetails?(scheduleShow,viewModel.cast)
                                }
                            
                        }
                    }
                    
                })
            }
            Spacer()
            Spacer()
        }
        .onAppear{
            viewModel.show()
            viewModel.emptyCast()
        }
        .background(.black)
        
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(getAllShows: ShowsAPIService(),getScheduleShows: ScheduleAPIService(), getCast: CastAPIService()))
    }
}






