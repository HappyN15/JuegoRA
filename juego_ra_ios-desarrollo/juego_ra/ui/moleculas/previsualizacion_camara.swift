import SwiftUI
import AVFoundation

struct CamaraPantallita: UIViewRepresentable{
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
