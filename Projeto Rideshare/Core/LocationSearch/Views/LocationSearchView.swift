//
//  LocationSearchView.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 15/06/24.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            
            // Header View
            
            HStack {
                
                // Linha Partida -> Destino
                
                VStack {
                    
                    Circle()
                        .fill(Color(.blue))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.systemBlue))
                        .frame(width: 6, height: 6)
                }
                
                // Caixas de Texto
                
                VStack{
                    TextField("Locatização Atual", text:
                                $startLocationText)
                    .frame(height: 32)
                    .background(Color(.systemGroupedBackground))
                    .padding(.trailing)
                    
                    TextField("Para onde?", text:
                                $viewModel.queryFragment)
                    .frame(height: 32)
                    .background(Color(.systemGray4))
                    .padding(.trailing)
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // List View
            
            ScrollView{
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultsCell(
                            title: result.title, subtitle: result.subtitle)
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        viewModel.selectLocation(result)
                                        mapState = .locationSelected
                                    }
                                }
                    }
                }
            }
            
        }
        .background(.white)
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}
