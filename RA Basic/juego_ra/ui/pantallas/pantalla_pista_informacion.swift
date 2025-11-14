//
//  pantalla_pista_inofrmacion.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 12/11/25.
//

import SwiftUI

struct PantallaPistaInformacion: View {
    var cuerpo_pista: PistaInformacion
    
    var body: some View {
        Text(cuerpo_pista.informacion)
    }
}
