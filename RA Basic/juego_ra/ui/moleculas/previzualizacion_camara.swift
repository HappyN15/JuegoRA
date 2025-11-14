//
//  previzualizacion_camara.swift
//  juego_ra
//
//  Created by Jadzia Gallegos on 12/11/25.
//

import SwiftUI
import AVFoundation

struct CamaraUIKitVista: UIViewRepresentable{
    let capa_sesion: AVCaptureVideoPreviewLayer
    
    func makeUIView(context: Context) -> some UIView {
        let vista = UIView()
        
        capa_sesion.videoGravity = .resizeAspectFill
        vista.layer.addSublayer(capa_sesion)
        return vista
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async{
            capa_sesion.frame = uiView.bounds
        }
    }
}

