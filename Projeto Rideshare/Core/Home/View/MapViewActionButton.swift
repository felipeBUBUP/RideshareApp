import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var mapState: MapViewState
    @Binding var showScheduleScreen: Bool
    @Binding var showScheduleRequestView: Bool
    @Binding var showScheduleConfirm: Bool
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
        if mapState != .noInput || showScheduleScreen || showScheduleRequestView || showScheduleConfirm {
            showScheduleScreen = false
            showScheduleRequestView = false
            showScheduleConfirm = false
            mapState = .noInput
        }
    }
    
    private func imageNameForState() -> String {
        // Se está na tela inicial, mostra o ícone do menu, senão mostra a seta para voltar
        return (mapState == .noInput && !showScheduleScreen && !showScheduleRequestView && !showScheduleConfirm) ? "line.3.horizontal" : "arrow.left"
    }
}

