//
//  Total.swift
//  MyNanny
//
//  Created by Gabriela Perez on 29/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Total: UIViewController {
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblCuotaNanny: UILabel!
    @IBOutlet weak var lblCuotaExtra: UILabel!
    @IBOutlet weak var lblDias: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblApellido: UILabel!

    @IBAction func doTapFinal(_ sender: Any) {
        performSegue(withIdentifier: "goToFinal", sender: self)
    }
        
    var totalNanny = [Nanny]()
    var nanny : Nanny?
    
    var nannyRequest : NannyRequest?
    var tiempoRequest : ValorTiempo?
    
    override func viewDidLoad() {
        let s = nanny
        let t = tiempoRequest
        let r = nannyRequest
        
        lblNombre.text = s?.nombre
        lblDias.text = t?.tiempo
        lblCuotaNanny.text  = String(describing: t!.precio)
        lblTotal.text = String(t!.precio + r!.acumulador!)
        lblCuotaExtra.text = String(describing: r!.acumulador!)
        lblApellido.text = s?.apellido
        
       
        let nr = nannyRequest
        let tr = tiempoRequest
        print(tr?.precio ?? "")
        print(nr?.meals ?? "")
        print(nr?.acumulador ?? "")
        //print(n?.nombre)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFinal"{
            
        }
    }
    
    func infoPost(horario: String, nombre: String, drive: String, meals: String, party: String){
        var url : String = "https://mynanny.azurewebsites.net/serviciosnanny.php"
        let diccionarioNanny = ["horario": horario, "nombre": nombre, "drive": drive, "meals": meals, "party": party]
        Alamofire.request(url, method: .post, parameters: diccionarioNanny, encoding: JSONEncoding.default).responseJSON { (response) in
            if let json = response.result.value{
                print(json)
            } else{
                print("no funcionotl")
            }
        }
        
    }
    
}
