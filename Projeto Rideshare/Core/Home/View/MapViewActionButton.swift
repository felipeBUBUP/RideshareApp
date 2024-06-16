//
//  MapViewActionButton.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 15/06/24.
//

import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var showSearchView: Bool
    
    var body: some View {
        Button {
            withAnimation(.spring()){
                showSearchView.toggle()
            }
        } label: {
            Image(systemName: showSearchView ?
                "arrow.left" : "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View{
        MapViewActionButton(showSearchView:
                .constant(true))
    }
}
