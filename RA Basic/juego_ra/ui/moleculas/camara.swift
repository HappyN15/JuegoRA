//
//  camara.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 12/11/25.
//
import SwiftUI

struct VistaCamara: View {
    @State var servicio_camara = ServicioCamara()
    
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                CamaraUIKitVista(capa_sesion: servicio_camara.obtener_previsualizacion_camara())
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            Task{
                servicio_camara.iniciar()
            }
        }
        .onDisappear {
            servicio_camara.detener()
        }
    }
}


#Preview {
    VistaCamara()
}

