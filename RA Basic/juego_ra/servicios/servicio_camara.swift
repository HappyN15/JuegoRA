//
//  servicio_camara.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 12/11/25.
//
import Foundation
import AVFoundation
import UIKit

@Observable
class ServicioCamara{
    private let sesion = AVCaptureSession()
    
    private var entrada_del_dispotivo: AVCaptureDeviceInput?
    private var salida_de_video: AVCaptureVideoDataOutput?
    
    private var previsualizacion:  AVCaptureVideoPreviewLayer?
    
    private let tipo_camara_preferida = AVCaptureDevice.default(for: .video)
    
    private var lista_de_sesion = DispatchQueue(label: "sesion.video")
    
    
    func autorizacion_camara() async -> Bool{
        let estado_autorizacion = AVCaptureDevice.authorizationStatus(for: .video)
        
        if estado_autorizacion == .notDetermined{
            await AVCaptureDevice.requestAccess(for: .video)
        }
        
        return estado_autorizacion == .authorized
    }
    
    init(){
        Task{
            await autorizacion_camara()
        }
    }
    
    func iniciar(){
        guard let dispositivo = AVCaptureDevice.default(for: .video),
              let entrada = try? AVCaptureDeviceInput(device: dispositivo),
              sesion.canAddInput(entrada)
              //sesion.canAddOutput(output: salida /// Que salida que no se ha descrito)
        else {
            return
        }
        
        sesion.beginConfiguration()
        sesion.addInput(entrada)
        //sesion.addOutput()
        sesion.commitConfiguration()
        sesion.startRunning()
    }
    
    func detener(){
        sesion.stopRunning()
        
        sesion.beginConfiguration()
        sesion.inputs.forEach { sesion.removeInput($0) }
        sesion.outputs.forEach { sesion.removeOutput($0) }
        
        sesion.commitConfiguration()
        
        previsualizacion = nil
    }
    
    func obtener_previsualizacion_camara() -> AVCaptureVideoPreviewLayer{
        if let capa = previsualizacion{
            return capa
        }
        
        let capa = AVCaptureVideoPreviewLayer(session: sesion)
        capa.videoGravity = .resizeAspectFill
        previsualizacion = capa
        return capa
    }
    
}



