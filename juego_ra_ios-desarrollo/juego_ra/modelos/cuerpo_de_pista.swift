//
//  cuerpo_de_pista.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 05/11/25.
//

enum TiposDePista{
    case informacion
    case interactiva
}

protocol CuerpoPista{
    var tipo: TiposDePista { get set }
    var informacion: String { get set }
}

struct PistaInformacion: CuerpoPista{
    var tipo = TiposDePista.informacion
    
    var informacion: String
}


