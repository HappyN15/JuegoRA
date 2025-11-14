//
//  juego_raApp.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 05/11/25.
//

import SwiftUI

@main
struct juego_raApp: App {
    @State var controlador_juego = ControladorJuego()
    
    var body: some Scene {
        WindowGroup {
            PantallaPrincipal()
                .environment(controlador_juego)
        }
    }
}
