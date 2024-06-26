//
//  LocationSearchResultsCell.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 15/06/24.
//

import SwiftUI

struct LocationSearchResultsCell: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading){
                Text(title)
                    .font(.body)
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultsCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultsCell(title: "Starbucks", subtitle: "123 Main St")
    }
}
