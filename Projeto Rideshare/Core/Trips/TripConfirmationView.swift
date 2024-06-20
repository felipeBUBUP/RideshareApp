import SwiftUI

struct TripConfirmationView: View {
    
    @Binding var showTripConfirmationView: Bool
    let destination: String
    let tripDate: Date
    @State private var selectedRideType: RideType = .SUV
    @EnvironmentObject var locationViewModel: LocationSearchViewModel

    var body: some View {
        VStack {

            Text("PARTIDA: \(destination)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("DATA E HORA: \(tripDate, formatter: dateFormatter)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
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
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
}
