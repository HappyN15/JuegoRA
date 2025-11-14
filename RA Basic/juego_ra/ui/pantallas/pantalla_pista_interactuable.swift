//
//  pantalla_pista_interactuable.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 10/11/25.
//
import SwiftUI

struct PantallaPistaInteractuable: View {
    var pista: PistaInteractuable
    
    var body: some View {
        Text(pista.informacion)
        
        ForEach(pista.interacciones){ boton in
            NavigationLink {
                SelectorPantallaPista(pista_id: boton.conecta_con_pista)
            }
            label: {
                Text(boton.mensaje)
            }
        }
    }
}

#Preview {
    PantallaPistaInteractuable(pista: PistaInteractuable(informacion: "Texto Vacio", interacciones: [Boton(mensaje: "Mensaje de Boton", conecta_con_pista: "pista_1")]))
}
