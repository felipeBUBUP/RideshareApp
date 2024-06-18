//
//  HomeView.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 15/06/24.
//

import SwiftUI

struct HomeView: View {

    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            
            // Map View ZStack
            
            ZStack(alignment: .bottom) {
                
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                } else if mapState == .noInput {
                    SearchActivationView()
                        .padding(.bottom, 250)
                        .onTapGesture {
                            withAnimation(.spring()){
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.bottom, 720)
            }
            
            // Caso o mapState seja locationSelected, apresentamos o RideRequestView()
            
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation) {
            location in
            if let location = location {
                locationViewModel.userLocation = location 
            }
        }
    }
}

#Preview {
    HomeView()
}
