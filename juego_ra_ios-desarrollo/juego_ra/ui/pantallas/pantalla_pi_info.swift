//
//  pantalla_pista_interactuable.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 10/11/25.
//
import SwiftUI

struct PantallaPistaInformacion: View {
    var cuerpo_pista: PistaInformacion
    
    var body: some View {
        Text(cuerpo_pista.informacion)
    }
}
