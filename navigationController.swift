//
//  navigationController.swift
//  MyNanny
//
//  Created by Gabriela Perez on 30/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit

class NavigationController : UINavigationController {
    var nannyRequest : NannyRequest?
    var tiempoRequest : ValorTiempo?

    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTablasNanny"{
            let destino = segue.destination as? NannyController
            destino?.nannyRequest = nannyRequest
            destino?.tiempoRequest = tiempoRequest
        }
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        performSegue(withIdentifier: "goToTablasNanny", sender: self)
    }
}
