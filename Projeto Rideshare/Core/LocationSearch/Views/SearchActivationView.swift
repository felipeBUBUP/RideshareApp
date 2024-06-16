//
//  SearchActivationView.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 15/06/24.
//

import SwiftUI

struct SearchActivationView: View {
    var body: some View {
        HStack{
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Para onde?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: .gray, radius: 6)
        )
        
    }
}

#Preview {
    SearchActivationView()
}
