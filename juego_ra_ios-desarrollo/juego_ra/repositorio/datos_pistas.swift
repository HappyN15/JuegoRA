import CoreLocation

let pistas = [
    Pista(
        ubicacion: CLLocation(latitude: 31.74249399834499, longitude: -106.43208805090772),
        id: "pista_1",
        cuerpo: PistaInformacion(
            informacion: "Texto para mostrar al usuario"
        )
    ),
    
    Pista(
        ubicacion: CLLocation(latitude: 31.74179721063090, longitude: -106.43289443881196),
        id: "pista_2",
        cuerpo: PistaInteractuable(
            informacion: "Texto de Prueba para la pantalla interactiva",
            interacciones: "pista_1"
        )
    )
]
