//
//  pistas.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 05/11/25.
//
import CoreLocation

let pistas = [
    Pista(
        ubicacion:
            CLLocation(latitude: 31.74249399834499, longitude: -106.43208805090772),
        id: "pista_1",
        cuerpo:
            PistaInformacion(
                informacion: "Texto para mostrar al usario"
            )
    ),
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.74205192244658,
            longitude: -106.43238899466401
        ),
        id: "pista_2",
        cuerpo: PistaInteractuable(
            informacion: "Texto de prueba para la pantalla interactuable",
            interacciones: [
                Boton(
                    mensaje: "Puchopicame para ir a la pista 1",
                    conecta_con_pista: "pista_1")
            ]
        )
    )
]



