
import SwiftUI

struct HomeView: View {
    @ObservedObject  var  viewModel = HomeViewModel<Any>(getAllShows: ShowsAPIService(),getScheduleShows: ScheduleAPIService())
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
                                    viewModel.onGoToDetails?(show)
                           
                            
                        }
                        
//
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
                        ForEach(viewModel.scheduleMovies,id: \.id) { show in
                            ScheduleMovieCardView(scheduleShow: show)
                                .onTapGesture {
                                    viewModel.onGoToDetails?(show)
                                }
                        }
                        }
                    
                })
            }
            Spacer()
            Spacer()
        }
        .background(.black)
        .onAppear{
            viewModel.show()
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(getAllShows: ShowsAPIService(),getScheduleShows: ScheduleAPIService()))
    }
}


struct MovieCardView: View {
    var show: ShowsAPIResponse
    var body: some View {
        VStack() {
            VStack{
            AsyncImage(url: show.image.medium) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray
                
            }
            
            
            }
            
            VStack() {
                HStack(alignment: .center, spacing: .leastNormalMagnitude){
                 Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                
                    Text("\(show.rating.average ?? 5.0,specifier: "%.2f")")
                        .foregroundColor(.gray)
                      Spacer()
                }
                HStack(alignment: .center){
                    Spacer()
                Text(show.name)
                    .tint(Color.white)
                    .padding(.trailing)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                Spacer()
                }
            }
            
        }
        .background(Color("DarkGray"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

struct ScheduleMovieCardView: View {
    
    var scheduleShow: ScheduleAPIResponse
    let dateFormatter = DateFormatter()
    
    var body: some View {
        VStack() {
            VStack{
                AsyncImage(url: scheduleShow.show.image?.medium) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray

            }


            }
            VStack(){
                HStack{
                Text(scheduleShow.airdate)
                    .foregroundColor(.gray)
                Text(scheduleShow.airtime)
                    .foregroundColor(.gray)
                }
                Text(scheduleShow.show.name)
                    .foregroundColor(.gray)
                
                
            }
            

        }
        .background(Color("DarkGray"))
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
        
}


