import SwiftUI

struct ScheduleConfirm: View {
    @Binding var showScheduleConfirm: Bool
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    let selectedDate: Date
    @State private var selectedRideType: RideType = .SUVLuxo

    var body: some View {
        VStack(spacing: 20) {  // Increased spacing for a more open layout
            Capsule()
                .foregroundColor(Color(.systemGray4))
                .frame(width: 80, height: 6)  // Larger capsule for a bolder look
                .padding(.top, 12)
                .padding(.horizontal)

            // Travel Information Section
            travelInfoSection()
                .padding(.horizontal, 20)  // Increased padding for better alignment

            // Ride Type Selection
            rideTypeSelection()
                .padding(.horizontal, 10)  // Adjusted for better horizontal space utilization

            // Payment Option Section
            paymentOptionSection()
                .padding(.horizontal, 20)  // Consistent padding with other sections

            // Confirmation Button
            Button("Confirmar") {
                showScheduleConfirm = false
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(height: 55)  // Slightly taller button for better tapability
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)  // Optional: Add shadow for depth
        .padding(.horizontal, 10)  // Outer padding for the overall view
    }

    // MARK: Subviews

    private func travelInfoSection() -> some View {
        HStack {
            VStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)  // Slightly larger circles

                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 2, height: 40)  // Longer rectangle for more visual separation

                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("Destino: \(locationViewModel.selectedAppLocation?.title ?? "Indefinido")")
                    .font(.title3)  // Larger font for better readability
                    .foregroundColor(.gray)

                Text("Data e Hora: \(selectedDate, formatter: dateFormatter)")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
    }

    private func rideTypeSelection() -> some View {
        VStack(alignment: .leading) {
            Text("Escolha uma Viagem")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.vertical, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(RideType.allCases, id: \.self) { type in
                        rideTypeView(type: type)
                    }
                }
            }
        }
    }

    private func paymentOptionSection() -> some View {
        HStack {
            Text("VISA")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(8)
                .background(Color.blue)
                .cornerRadius(6)
                .foregroundColor(.white)

            Text("**** 1234")
                .font(.headline)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .padding(.leading)
        }
        .frame(height: 60)  // Taller height for the payment option
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }

    private func rideTypeView(type: RideType) -> some View {
        VStack(alignment: .leading) {
            Image(type.imageName)
                .resizable()
                .scaledToFit()

            VStack(alignment: .leading, spacing: 4)
            {
                Text(type.description)
                    .font(.system(size: 14, weight: .semibold))
                Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(8)
        }
        .frame(width: 120, height: 180)  // Increased frame size for a larger visual presence
        .foregroundColor(type == selectedRideType ? .white : .black)
        .background(Color(type == selectedRideType ? .systemBlue : .systemGray6))
        .cornerRadius(12)
        .onTapGesture {
            withAnimation(.spring()) {
                selectedRideType = type
            }
        }
    }
}

