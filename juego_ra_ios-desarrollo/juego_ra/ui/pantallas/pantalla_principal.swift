import SwiftUI

struct PantallaPrincipal: View {
    @State var proveedor_ubicacion = ServicioUbicacion()
    var body: some View {
        NavigationStack{
            ForEach(pistas){ pista in
                if(pista.puede_ser_recogida(ubicacion: proveedor_ubicacion.ubicacion_actual)){
                    NavigationLink{
                        Text("Esta es la pantalla de la pista.")
                    }label: {
                        Text("Presioname para ir a la pista \(pista.id)")
                    }.buttonStyle(.plain)
                }
                else if(pista.esta_en_rango(ubicacion: proveedor_ubicacion.ubicacion_actual)){
                    
                    if let porcentaje = pista.calcular_porcentaje(ubicacion: proveedor_ubicacion.ubicacion_actual){
                        switch(porcentaje){
                        case 1...10:
                            Text("Te estas quemando")
                        case 11...20:
                            Text("Te estas acercando")
                        case 21...30:
                            Text ("Estas acercandote")
                        default:
                            Text("Muy Lejos")
                        }
                    }
                    else{
                        Text("No se puede obtener la distancia necesaria, comprueba tu conexion con el gps")
                    }

                }else{
                    Text("No estas viendo pistas ahora mismo")
                }
            }
        }
    }
}

#Preview{
    PantallaPrincipal()
}
