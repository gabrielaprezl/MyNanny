//
//  Parent.swift
//  MyNanny
//
//  Created by Gabriela Perez on 31/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Parent{
    var idPadre : Int
    
    var usuario : String
    var password : String
    
    var hijos : String
    var nombre : String
    var apellido : String
    var domicilio : String
    var ciudad : String
    var telefono : String
    var correo : String
    
    var imgPerfil : UIImage?
    var imgActa : UIImage?
    var imgINE : UIImage?
    var imgDireccion : UIImage?
    
    init(desdeDiccionario diccionario: NSDictionary, callback: (() -> Void)?) {
        idPadre = 0
        
        usuario = ""
        password = ""
        
        hijos = ""
        nombre = ""
        apellido = ""
        domicilio = ""
        ciudad = ""
        telefono = ""
        correo = ""
        
        if let idLugar = diccionario.value(forKey: "idPadre") as? Int{
            idPadre = idLugar
            if let usuarioParent = diccionario.value(forKey: "usuario") as? String{
                usuario = usuarioParent
            }
            if let passwordParent = diccionario.value(forKey: "password") as? String{
                password = passwordParent
            }
            if let hijosP = diccionario.value(forKey: "hijos") as? String{
                hijos = hijosP
            }
            if let nombreParent = diccionario.value(forKey: "nombre") as? String{
                nombre = nombreParent
            }
            if let apellidoParent = diccionario.value(forKey: "apellido") as? String{
                apellido = apellidoParent
            }
            if let domicilioP = diccionario.value(forKey: "domicilio") as? String{
                domicilio = domicilioP
            }
            if let ciudadP = diccionario.value(forKey: "ciudad") as? String{
                ciudad = ciudadP
            }
            if let telefonoP = diccionario.value(forKey: "telefono") as? String{
                telefono = telefonoP
            }
            if let correoP = diccionario.value(forKey: "correo") as? String{
                correo = correoP
            }
        }
    }
}
