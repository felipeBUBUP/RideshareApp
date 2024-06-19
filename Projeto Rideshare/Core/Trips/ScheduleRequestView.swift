import SwiftUI

struct ScheduleRequestView: View {
    @Binding var showScheduleRequestView: Bool
    @State private var selectedDate: Date = Date()
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @Binding var showScheduleConfirm: Bool

    var body: some View {
        VStack(spacing: 10) { // Reduz o espaçamento entre os elementos
            
            Text("SELCIONE DATA E HORA")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            DatePicker(
                "Selecione Data e Hora:",
                selection: $selectedDate,
                in: Date()...,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding(.horizontal, 10) // Reduz o padding horizontal

            Button("Confirmar Agendamento") {
                showScheduleRequestView = false
                showScheduleConfirm = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.horizontal, 10) // Reduz o padding ao redor do botão
        }
        .padding(.vertical, 10) // Reduz o padding vertical do VStack
        .background(Color.white)
        .cornerRadius(16)
        .padding(.horizontal, 10) // Reduz o padding horizontal da view externa
    }
}

