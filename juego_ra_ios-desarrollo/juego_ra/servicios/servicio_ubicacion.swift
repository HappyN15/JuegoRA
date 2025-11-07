//
//  servicio_ubicacion.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 05/11/25.
//

import Foundation
import CoreLocation

@Observable
class ServicioUbicacion: NSObject, CLLocationManagerDelegate{
    var manejador_ubicacion = CLLocationManager()
    
    var estado_de_autorizacion: CLAuthorizationStatus?
    var ubicacion_actual: CLLocation?
    
    override init(){
        super.init()
        
        manejador_ubicacion.delegate = self
        manejador_ubicacion.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        estado_de_autorizacion = manager.authorizationStatus
        
        switch(manager.authorizationStatus){
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
                manager.requestAlwaysAuthorization()
                
            case .authorizedAlways:
                manager.startUpdatingLocation()
                
            case .authorizedWhenInUse:
                manager.startUpdatingLocation()
                
            case .denied:
                print("Que malvado es el usario")
                
            case .restricted:
                print("Tenemos permisos restringidos para usar la ubicacion")
                
            default:
                print("Algo salio muy mal!!!")
        }
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\(locations.last)")
        
        if locations.last != nil{
            ubicacion_actual = locations.last
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Obtuvimos un error: \(error.localizedDescription)")
    }
    
    func detener_ubicacion(){
        manejador_ubicacion.stopUpdatingLocation()
    }
}
