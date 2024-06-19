import SwiftUI

struct ScheduleConfirm: View {
    @Binding var showScheduleConfirm: Bool
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    let selectedDate: Date
    @State private var selectedRideType: RideType = .SUVLuxo  // Estado para armazenar o tipo de viagem selecionado
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // Informações de viagem
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.blue))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Circle()
                        .fill(Color(.systemBlue))
                        .frame(width: 8, height: 8)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Partida: \(locationViewModel.selectedAppLocation?.title ?? "Indefinido")")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    Text("Destino:")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    Text("Data e Hora: \(selectedDate, formatter: dateFormatter)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            // Seleção do tipo de viagem
            Text("Escolha uma Viagem")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding(8)
                        }
                        .frame(width: 112, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : .black)
                        .background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type == selectedRideType ? 1.1 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // Opção de pagamento
            HStack {
                Text("VISA")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(Color.blue)
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
            
            // Botão de confirmação da viagem
            Button("Confirmar") {
                showScheduleConfirm = false
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.bottom, 24)
        }
        .background(Color.white)
        .cornerRadius(16)
        .padding(.horizontal)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
    
}
