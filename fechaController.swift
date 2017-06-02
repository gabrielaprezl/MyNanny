//
//  fechaController.swift
//  MyNanny
//
//  Created by Gabriela Perez on 30/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import  UIKit

class FechaController : UIViewController {
    
    var nannyRequest : NannyRequest?
    var tiempoRequest : ValorTiempo?
    
    
    @IBAction func doTapLoading(_ sender: Any) {
        performSegue(withIdentifier: "goToLoading", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let nr = nannyRequest
        let tr = tiempoRequest
        print(tr?.precio ?? "")
        print(nr?.meals ?? "")*/
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLoading"{
            let destino = segue.destination as? NannyLoading
            destino?.nannyRequest = nannyRequest
            destino?.tiempoRequest = tiempoRequest
        }
    }
    
    
}
