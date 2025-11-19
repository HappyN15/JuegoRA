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
            CLLocation(latitude: 31.742086, longitude: -106.432385),
        id: "pista_1",
        cuerpo:
            PistaInformacion(
                informacion: "La grieta se encuentra en el edificio donde la moda y la tecnologia se encuentran."
            )
    ),
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.742086,
            longitude: -106.432385
        ),
        id: "pista_2",
        cuerpo: PistaInteractuable(
            informacion: "Necesitas una pista?",
            interacciones: [
                Boton(
                    mensaje: "Pista 1",
                    conecta_con_pista: "pista_1")
            ]
        )
    )
]



