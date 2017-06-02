//
//  Extras.swift
//  MyNanny
//
//  Created by Gabriela Perez on 30/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit

class NannyRequest{
    var meals : Bool?
    var party : Bool?
    var drive : Bool?
    
    var acumulador : Int?
    
    init(nannyMeals: Bool, nannyParty: Bool, nannyDrive: Bool, acumulador: Int){
        self.meals = nannyMeals
        self.party = nannyParty
        self.drive = nannyParty
        self.acumulador = acumulador
    }
}


class Specification : UIViewController {
    var acumulador : Int = 0
    
    
    @IBOutlet weak var swDrive: UISwitch!
    @IBOutlet weak var swParty: UISwitch!
    @IBOutlet weak var swMeals: UISwitch!
    @IBAction func doBtnExtra(_ sender: Any)
    {
        checkSwitch(mySwitch: swDrive, precio: 200)
        checkSwitch(mySwitch: swParty, precio: 100)
        checkSwitch(mySwitch: swMeals, precio: 300)
        nannyRequest = NannyRequest(nannyMeals: swMeals.isOn, nannyParty: swParty.isOn, nannyDrive: swParty.isOn, acumulador: acumulador)
        
        
        performSegue(withIdentifier: "goToFecha", sender: self)
    }
    
    var nannyRequest : NannyRequest?
    var valorTiempoV : ValorTiempo?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFecha"{
            let destino = segue.destination as? FechaController
            destino?.nannyRequest = nannyRequest
            destino?.tiempoRequest = valorTiempoV
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func checkSwitch(mySwitch : UISwitch, precio: Int){
        if mySwitch.isOn{
            acumulador += precio
        }
        
    }

    
    
}
