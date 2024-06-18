//
//  MapViewActionButton.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 15/06/24.
//

import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    
    var body: some View {
        Button {
            withAnimation(.spring()){
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Define Estados do Botão
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case.noInput:
            print("DEBUG: No Input")
        case.searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedAppLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case.noInput:
            return "line.3.horizontal"
        case.searchingForLocation, .locationSelected:
            return "arrow.left"
        default:
            return "line.3.horizontal"
        }
    }
    
    
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View{
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
