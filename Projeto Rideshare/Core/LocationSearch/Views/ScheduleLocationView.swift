import SwiftUI

struct ScheduleLocationView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @Binding var showScheduleScreen: Bool
    @Binding var showScheduleRequestView: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Circle()
                        .fill(Color(.systemBlue))
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Localização Atual", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(5)
                        .padding(.horizontal)

                    TextField("Para onde?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .cornerRadius(5)
                        .padding(.horizontal)
                }
            }
            .padding(.horizontal)
            .padding(.top, 130)

            Divider().padding(.vertical)

            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultsCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectLocation(result)
                                    showScheduleScreen = false
                                    showScheduleRequestView = true
                                }
                            }
                    }
                }
            }
        }
        .background(Color.white)
    }
}

