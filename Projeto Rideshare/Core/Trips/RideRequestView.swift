//
//  RideRequestView.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 17/06/24.
//

import SwiftUI

struct RideRequestView: View {
    
    @State private var selectedRideType: RideType = .SUVLuxo
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
    
        VStack {
            
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // Trip Info View
            
            HStack {
                
                // Linha Partida -> Destino
                VStack {
                    Circle()
                        .fill(Color(.blue))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(Color(.systemBlue))
                        .frame(width: 8, height: 8)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Informações Partida
                    
                    HStack{
                        Text("Localização Atual")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor((.gray))
                        
                        Spacer()
                        
                        Text("1:30PM")
                            .font(.system(size:14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    // Informações Destino
                    
                    HStack{
                        Text("Starbucks Coffee")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Text("1:45PM")
                            .font(.system(size:14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            // Ride Type Selection View
            
            Text("ESCOLHA UMA VIAGEM")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
           // Scroll - Opções de Corrida
            
            ScrollView(.horizontal) {
                
                // Disposição horizontal das caixas
                
                HStack(spacing: 12) {
                    
                    ForEach(RideType.allCases) { type in
                    
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            // Disposição vertical das informações do carro
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text(type.description)
                                    .font(.system(size:14, weight: .semibold))
                                Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                                    .font(.system(size:14, weight: .semibold))
                            }
                            .padding(8)
                            
                        }
                        .frame(width: 112, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : .black)
                        .background(Color(type == selectedRideType
                                          ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type == selectedRideType ? 1.1 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture{
                            withAnimation(.spring()) {
                                selectedRideType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            
            // Paytment Option View
            
            HStack(spacing: 12){
                
                // Pagamento - Cartão
                
                Text("VISA")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // Request Ride Button
            
            Button{
                
            } label: {
                Text("CONFIRMAR")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
            }
            
        }
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(16)

    }
}

#Preview {
    RideRequestView()
}
