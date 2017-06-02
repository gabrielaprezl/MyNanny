//
//  ParentViewController.swift
//  MyNanny
//
//  Created by Gabriela Perez on 31/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ParentController: UITableViewController {
    var parents : [Parent] = []
    
    var nannyRequest : NannyRequest?
    var tiempoRequest : ValorTiempo?
    var nannImp : Nanny?
    
    var parentt : Parent?
    var parentSelected : Parent?
    
    
    @IBOutlet var tvPadres: UITableView!
    override func viewDidLoad() {
        Alamofire.request("https://mynanny.azurewebsites.net/API/padre.php", method: .get, parameters: nil).responseJSON { response in
            if let listaPadres = response.result.value as? NSArray{
                for lugar in listaPadres{
                    if let diccionarioLugar = lugar as? NSDictionary{
                        self.parents.append(Parent(desdeDiccionario: diccionarioLugar, callback: self.actualizarTableView))
                    }
                }
                self.tvPadres.reloadData()
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return parents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPadres", for: indexPath) as! CeldaParent
        cell.lblNombre.text = parents[(indexPath as NSIndexPath).row].nombre
        cell.lblNoHijos.text = parents[(indexPath as NSIndexPath).row].hijos
        
        return cell
    }
    
    func actualizarTableView(){
        tvPadres.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        parentSelected = parents[indexPath.row]
        performSegue(withIdentifier: "goToDetallePadre", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetallePadre"{
            let destino = segue.destination as! DetallePadre
            destino.parentt = parentSelected

        }
    }
}
