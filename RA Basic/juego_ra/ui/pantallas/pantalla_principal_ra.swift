//
//  pantalla_principal_ra.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 07/11/25.
//
import SwiftUI

struct PantallaPrincipal: View{
    @State var proveedor_ubicacion = ServicioUbicacion()
    
    
    var body: some View{
        VistaCamara()
        
        
        NavigationStack{
            ForEach(pistas){ pista in
                if(pista.puede_ser_recogida(
                    ubicacion: proveedor_ubicacion.ubicacion_actual)
                    ){
                    NavigationLink{
                        SelectorPantallaPista(pista_id: pista.id)
                    } label: {
                        Text("Obtener pista \(pista.id)")
                    }
                    .buttonStyle(.plain)
                }
                else if(pista.esta_en_rango(
                    ubicacion: proveedor_ubicacion.ubicacion_actual)
                    ){
                    if let porcentaje = pista.calcular_porcentaje(ubicacion: proveedor_ubicacion.ubicacion_actual){
                        Text("La grieta esta \(porcentaje) en distancia")
                        switch(porcentaje){
                            case 1...10:
                                NavigationLink{
                                    SelectorPantallaPista(pista_id: pista.id)
                                } label: {
                                    Text("Obtener \(pista.id)")
                                }
                                .buttonStyle(.plain)
                            case 11...20:
                                Text("Hay una grieta cerca")
                            case 21...30:
                                Text("Estas acercandote")
                            default:
                                Text("No hay una grieta cerca")
                        }
                    }
                }
                
                
                else {
                    Text("NO se puede obtener la distancia, comprueba tu conexion con el gps")
                }

                
            }
        }
            
    }
}

#Preview {
    PantallaPrincipal()
}

