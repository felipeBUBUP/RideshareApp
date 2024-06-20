import SwiftUI

struct TripPlanningView: View {
    
    @Binding var showTripConfirmationView: Bool
    @Binding var showTripPlanningView: Bool
    @State private var startPoint = ""
    @State private var tripDate = Date()
    @State private var duration: Double = 1.0

    var body: some View {
        VStack {
            
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            TextField("Ponto de Partida", text: $startPoint)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Divider()
            
            Text("PERSONALIZE A VIAGEM:")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)

            DatePicker(
                "Data e Hora",
                selection: $tripDate,
                displayedComponents: [.date, .hourAndMinute]
            )
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding()
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                Text("Duração: \(duration, specifier: "%.1f") horas")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Slider(value: $duration, in: 0.5...12, step: 0.5)
            }
            
            Divider()

            Button{
                showTripConfirmationView = true
                showTripPlanningView = false
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
        .cornerRadius(12)
        .frame(maxWidth: .infinity, maxHeight: 400)
        .shadow(radius: 10)
    }
}
