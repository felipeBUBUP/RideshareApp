//
//  HomeView.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 15/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSearchView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if showSearchView {
                LocationSearchView(showLocationSearchView: $showSearchView)
            } else{
                SearchActivationView()
                    .padding(.bottom, 250)
                    .onTapGesture {
                        withAnimation(.spring()){
                            showSearchView.toggle()
                        }
                    }
            }
            
            MapViewActionButton(showSearchView: $showSearchView)
                .padding(.leading)
                .padding(.bottom, 720)
        }
    }
}

#Preview {
    HomeView()
}
