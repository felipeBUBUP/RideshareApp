import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var mapState: MapViewState
    @Binding var showScheduleScreen: Bool
    @Binding var showScheduleRequestView: Bool
    @Binding var showScheduleConfirm: Bool
    @Binding var showTripPlanningView: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button(action: {
            withAnimation {
                actionForState()
            }
        }) {
            Image(systemName: imageNameForState())
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func actionForState() {
        // Reset all states when any close action is triggered
        showScheduleScreen = false
        showScheduleRequestView = false
        showScheduleConfirm = false
        showTripPlanningView = false // Garante que o estado do planejamento da viagem também seja redefinido
        mapState = .noInput
    }
    
    private func imageNameForState() -> String {
        // Se está em algum estado específico, mostra a seta para voltar, caso contrário mostra o ícone do menu
        return (mapState == .noInput && !showScheduleScreen && !showScheduleRequestView && !showScheduleConfirm && !showTripPlanningView) ? "line.3.horizontal" : "arrow.left"
    }
}

