import SwiftUI

struct BottomPanelView: View {
    @Binding var mapState: MapViewState
    @Binding var showScheduleScreen: Bool
    @EnvironmentObject var locationViewModel: LocationSearchViewModel

    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                mapState = .searchingForLocation  // Altera o estado para exibir LocationSearchView
            }) {
                SearchActivationView()
            }
            .buttonStyle(PlainButtonStyle()) // Mantém a aparência original do SearchActivationView

            HStack {
                Button("Agendar Viagem") {
                    showScheduleScreen = true  // Ativa a exibição da ScheduleLocationView
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)

                Button("Planejar Viagem") {
                    // Implementação da ação de planejar
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 20)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

