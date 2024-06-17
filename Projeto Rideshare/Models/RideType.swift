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
    
    // MARK: - Modelo de Preços
    
    // Valores Base
    
    var baseFare: Double {
        switch self{
        case .Sedan: return 5
        case .Executivo: return 8
        case .SUV: return 6
        case .SUVLuxo: return 12
        case .MiniVan: return 8
        case .Van: return 15
        }
    }
    
    // Valores = Base + Distancia * Valor/Distancia
    
    func computePrice(for distanceInMeters: Double) -> Double {
        switch self{
        case .Sedan: return distanceInMeters * 0.001 + baseFare
        case .Executivo: return distanceInMeters * 0.0015 + baseFare
        case .SUV: return distanceInMeters * 0.001 + baseFare
        case .SUVLuxo: return distanceInMeters * 0.0015 + baseFare
        case .MiniVan: return distanceInMeters * 0.0012 + baseFare
        case .Van: return distanceInMeters * 0.002 + baseFare
        }
    }
}
