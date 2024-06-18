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
                Button("Agendar Transfer") {
                    showScheduleScreen = true  // Ativa a exibição da ScheduleLocationView
                }
                .buttonStyle(PrimaryButtonStyle())

                Button("Planejar Viagem") {
                    // Implementação da ação de planejar
                }
                .buttonStyle(PrimaryButtonStyle())
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 20)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}



struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
