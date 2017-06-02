//
//  tiempoController.swift
//  MyNanny
//
//  Created by Gabriela Perez on 30/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit

class ValorTiempo{
    var tiempo : String
    var precio : Int
    
    init(tiempoH: String, precioF: Int) {
        self.precio = precioF
        self.tiempo = tiempoH
    }
}


class Tiempo: UIViewController {
    var valorTiempo : ValorTiempo?
    
    @IBAction func doTapManana(_ sender: Any) {
        valorTiempo = ValorTiempo(tiempoH: "9am - 12pm", precioF: 400)
        performSegue(withIdentifier: "goToExtras", sender: self)
    }
    
    @IBAction func doTapTarde(_ sender: Any) {
        valorTiempo = ValorTiempo(tiempoH: "2pm - 6pm", precioF: 400)
        performSegue(withIdentifier: "goToExtras", sender: self)
    }
    
    @IBAction func doTapNoche(_ sender: Any) {
        valorTiempo = ValorTiempo(tiempoH: "8pm - 12am", precioF: 400)
        performSegue(withIdentifier: "goToExtras", sender: self)
    }
    
    @IBAction func doTapAllDay(_ sender: Any) {
        valorTiempo = ValorTiempo(tiempoH: "9am - 9am", precioF: 2400)
        performSegue(withIdentifier: "goToExtras", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToExtras"{
            let destino = segue.destination as? Specification
           destino?.valorTiempoV = valorTiempo
        }
    }
}
