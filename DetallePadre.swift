//
//  DetallePadre.swift
//  MyNanny
//
//  Created by Gabriela Perez on 01/06/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit

class DetallePadre : UIViewController {
    
    @IBOutlet weak var lblNoHijos: UILabel!
    @IBOutlet weak var lblDireccion: UILabel!
    @IBOutlet weak var lblImagenPerfil: UIImageView!
    @IBOutlet weak var lblApellido: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imgPerfilP: UIImageView!
    @IBOutlet weak var imgDNI: UIImageView!
    @IBOutlet weak var imgAddress: UIImageView!
    @IBOutlet weak var imgBirth: UIImageView!
    
    var parentt : Parent?
    override func viewDidLoad() {
        let p = parentt
        
        let noTiene = UIImage(named: "cancel")
        let siTiene = UIImage(named: "checked")
        
        lblNombre.text = p?.nombre
        lblApellido.text = p?.apellido
        lblNoHijos.text = p?.hijos
        lblDireccion.text = p?.domicilio
        lblImagenPerfil.image = p?.imgPerfil
    
        //CREDENCIAL INE
        if(p?.imgINE == nil){
            imgDNI.image = UIImage(named: "cancel")!
            imgDNI.image = noTiene
            print("no hay")
            
        } else{
            imgDNI.image = UIImage(named: "checked")
            imgDNI.image = siTiene
            print("si hay")
        }
        //Acta
        if(p?.imgActa == nil){
            imgBirth.image = UIImage(named: "cancel")!
            imgBirth.image = noTiene
            print("no hay")
            
        } else{
            imgBirth.image = UIImage(named: "checked")
            imgBirth.image = siTiene
            print("si hay")
        }
        //Address
        if(p?.domicilio == nil){
            imgAddress.image = UIImage(named: "cancel")!
            imgAddress.image = noTiene
            print("no hay")
        } else{
            imgAddress.image = UIImage(named: "checked")
            imgAddress.image = siTiene
            print("si hay")
        }

    }
}
