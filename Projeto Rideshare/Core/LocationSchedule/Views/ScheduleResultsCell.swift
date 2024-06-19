import SwiftUI

struct ScheduledLocationSearchResultsCell: View {
    let title: String
    let subtitle: String
    @State private var travelDate: Date = Date()  // Data da viagem com valor inicial como a data atual

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.body)
                    Text(subtitle)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 8)

                Spacer() // Mantém os componentes de texto alinhados à esquerda

                DatePicker(
                    "Data da Viagem",
                    selection: $travelDate,
                    displayedComponents: .date
                )
                .datePickerStyle(CompactDatePickerStyle()) // Estilo compacto para economizar espaço
                .labelsHidden() // Esconde o label para uma aparência mais limpa
            }
            .padding(.vertical, 8)

            Divider()
        }
        .padding(.horizontal)
    }
}

struct ScheduledLocationSearchResultsCell_Previews: PreviewProvider {
    static var previews: some View {
        ScheduledLocationSearchResultsCell(title: "Starbucks", subtitle: "123 Main St")
    }
}

