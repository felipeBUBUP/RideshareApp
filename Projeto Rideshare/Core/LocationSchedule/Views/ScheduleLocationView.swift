import SwiftUI

struct ScheduleLocationView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @Binding var showScheduleScreen: Bool  // Controle da visibilidade

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
                    TextField("Locatização Atual", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(5)  // Assegure arredondamento se necessário
                        .padding(.horizontal)  // Ajuste conforme necessário para alinhar com LocationSearchView

                    TextField("Para onde?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .cornerRadius(5)  // Assegure arredondamento se necessário
                        .padding(.horizontal)  // Ajuste conforme necessário para alinhar com LocationSearchView
                }
            }
            .padding(.horizontal)
            .padding(.top, 130)  // Ajuste o topo se necessário

            Divider().padding(.vertical)

            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultsCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel.selectLocation(result)
                                    showScheduleScreen = false  // Altera para fechar a tela
                                }
                            }
                    }
                }
            }
        }
        .background(Color.white)
    }
}

