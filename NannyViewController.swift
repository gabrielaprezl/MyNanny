//
//  NannyViewController.swift
//  MyNanny
//
//  Created by Gabriela Perez on 25/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NannyController: UITableViewController{
    
    @IBOutlet var tvNannys: UITableView!
    var nannys : [Nanny] = []
    var nannyRequest : NannyRequest?
    var tiempoRequest : ValorTiempo?
    var nannImp : Nanny?
    
    var nannySelected : Nanny?
    
    override func viewDidLoad() {
        self.title = "Niñeras"
        
        /*nannys.append(Nanny(nombre: "Beatriz Arreola", edad: "21 años", cargo: "Estudiante", tiempo: "Vespertino", foto: "nann1"))
        nannys.append(Nanny(nombre: "Miranda Moreno", edad: "22 años", cargo: "Estudiante", tiempo: "Matutino", foto: "nann2"))*/
        
        /*
         Interpretar imagen por la URL(string : "https://www.direccion.com/")
         
         */
        
        Alamofire.request("https://mynanny.azurewebsites.net/API/nanny.php", method: .get, parameters: nil).responseJSON { response in
            if let listaNannys = response.result.value as? NSArray{
                for lugar in listaNannys{
                    if let diccionarioLugar = lugar as? NSDictionary{
                        self.nannys.append(Nanny(desdeDiccionario: diccionarioLugar, callback: self.actualizarTableView))
                    }
                }
                self.tvNannys.reloadData()
            }
        }
        
        
        let nr = nannyRequest
        let tr = tiempoRequest
        let na = nannImp
        print(tr?.precio ?? "")
        print(nr?.meals ?? "")
        print(na?.nombre ?? "")
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nannys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaNanny", for: indexPath) as! CeldaNanny
        cell.lblNombre.text = nannys[(indexPath as NSIndexPath).row].nombre
        cell.lblEdad.text  = nannys[(indexPath as NSIndexPath).row].edad
        cell.lblCargo.text = nannys[(indexPath as NSIndexPath).row].cargo
        cell.lblTiempo.text = nannys[(indexPath as NSIndexPath).row].tiempo
        cell.imgPerfil.image = nannys[(indexPath as NSIndexPath).row].imgPerfil
        //No se llena imgPerfil en Nanny correctamente
        return cell
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nannySelected = nannys[indexPath.row]
        performSegue(withIdentifier: "goToNannyDetalle", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNannyDetalle"{
            let destino = segue.destination as! DetalleNanny
            //destino.detalleNanny = [sender as! Nanny]
            destino.nanny = nannySelected
            destino.nannyRequest = nannyRequest
            destino.tiempoRequest = tiempoRequest
            
            
        }
    }
    
    func actualizarTableView(){
        tvNannys.reloadData()
    }
    
}
