import Foundation
import SwiftUI

@Observable
class ControladorJuego{
    var pistas_encontradas = [Pista]()
    
    func el_usuario_encontro(pista: Pista){
        pistas_encontradas.append(pista)
    }
}
