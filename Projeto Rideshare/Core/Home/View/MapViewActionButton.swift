import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @Binding var showScheduleScreen: Bool  // Adicione este binding para controlar a visibilidade da ScheduleLocationView

    var body: some View {
        Button {
            withAnimation(.spring()){
                actionForState()
            }
        } label: {
            Image(systemName: imageNameForState())
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState() {
        if showScheduleScreen {
            // Ação para fechar a ScheduleLocationView e voltar para a tela principal
            showScheduleScreen = false
        } else {
            // Implemente outras lógicas conforme o estado atual do mapa
            mapState = .noInput
            viewModel.selectedAppLocation = nil
        }
    }
    
    func imageNameForState() -> String {
        if showScheduleScreen {
            return "arrow.left"  // Ícone de seta para a esquerda quando a ScheduleLocationView está visível
        } else {
            switch mapState {
            case .noInput:
                return "line.3.horizontal"
            default:
                return "arrow.left"
            }
        }
    }
}

