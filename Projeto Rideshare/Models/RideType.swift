//
//  RideType.swift
//  Projeto Rideshare
//
//  Created by Ana Luisa Resende Pimenta on 17/06/24.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    
    case Sedan
    case Executivo
    case SUV
    case SUVLuxo
    case MiniVan
    case Van
    
    var id: Int { return rawValue }
    
    // Nome - Veículos
    
    var description: String {
        switch self {
        case .Sedan: return "Sedan"
        case .Executivo: return "Executivo"
        case .SUV: return "SUV"
        case .SUVLuxo: return "SUV Luxo"
        case .MiniVan: return "Mini Van"
        case .Van: return "Van"
        }
    }
    
    // Nome - Ícone dos Veículos (Assets)
    
    var imageName: String {
        switch self {
        case .Sedan: return "Sedan"
        case .Executivo: return "Executivo"
        case .SUV: return "SUV"
        case .SUVLuxo: return "SUV-Luxo"
        case .MiniVan: return "Mini-Van"
        case .Van: return "Van"
        }
        
    }
}
