import SwiftUI

struct ScheduleRequestView: View {
    @Binding var showScheduleRequestView: Bool
    @State private var selectedDate: Date = Date()
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @Binding var showScheduleConfirm: Bool

    var body: some View {
        VStack(spacing: 20) {  // Increased spacing for clarity
            Capsule()
                .foregroundColor(Color(.systemGray4)) // Capsule to indicate swipe down or modal indicator
                .frame(width: 60, height: 6)
                .padding(.top, 10)

            Text("SELECIONE DATA E HORA")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.horizontal)

            DatePicker(
                "Selecione Data e Hora:",
                selection: $selectedDate,
                in: Date()...,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding(.horizontal)  // Consistent horizontal padding
            

            Button("Confirmar Agendamento") {
                showScheduleRequestView = false
                showScheduleConfirm = true
            }
            .padding()
            .frame(maxWidth: .infinity)  // Ensures the button stretches to full width
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.bottom, 10)  // Adds padding at the bottom for spacing

        }
        .padding(.horizontal)  // Reduces horizontal padding to allow more content width
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)  // Optional: add shadow for better UI depth
        .padding(.horizontal, 10)  // Adjust horizontal padding for overall view consistency
    }
}

