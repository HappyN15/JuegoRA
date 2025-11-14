//
//  selector_pantalla_pista.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 10/11/25.
//
import SwiftUI

struct SelectorPantallaPista: View {
    var pista_id: String
    
    @State var pista_actual: Pista? = nil
    
    var body: some View {
        Text("")
            .onAppear{
                obtener_pista()
            }
        
        switch pista_actual?.cuerpo{
            case let de_informacion as PistaInformacion:
                PantallaPistaInformacion(cuerpo_pista: de_informacion)
                
            case let de_interaccion as PistaInteractuable:
                PantallaPistaInteractuable(pista: de_interaccion)
                
            default:
                Text("Aqui no ha nada")
        }
    }
    
    func obtener_pista(){
        for pista in pistas {
            if pista.id == pista_id{
                pista_actual = pista
                break
            }
        }
        
        print("LA pista actual es \(pista_actual)")
    }
    
}

#Preview {
    SelectorPantallaPista(pista_id: "pista_1")
}

