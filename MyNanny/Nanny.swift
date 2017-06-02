//
//  Nanny.swift
//  MyNanny
//
//  Created by Gabriela Perez on 25/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Nanny{
    var id : Int
    
    var usuario : String
    var password : String
    
    var nombre : String
    var apellido : String
    var edad : String
    var cargo : String
    var tiempo : String
    var domicilio : String
    var telefono : String
    var descripcion : String
    
    var correo : String
    var ciudad : String
    //var foto : String?
    
    var fotoPerfil : String?
    var imgPerfil : UIImage?
    
    var fotoActa : String?
    var imgActa : UIImage?
    
    var fotoINE : String?
    var imgINE : UIImage?
    
    var fotoLic : String?
    var imgLicencia : UIImage?
    
    var fotoAntecedentes : String?
    var imgAntecedentes : UIImage?
    
    var fotoExamen : String?
    var imgExamenM : UIImage?
    
    /*init(nombre:String, edad:String, cargo:String, tiempo:String, foto:String) {
       self.cargo = cargo
        self.edad = edad
        self.nombre = nombre
        self.tiempo = tiempo
        
        self.foto = foto
        //imgPerfil = UIImage(named: foto)
    }*/
    
    init(desdeDiccionario diccionario: NSDictionary, callback: (() -> Void)?) {
        id = 0
        
        usuario = ""
        password = ""
        
        nombre = ""
        apellido = ""
        edad = ""
        cargo = ""
        tiempo = ""
        telefono = ""
        domicilio = ""
        descripcion = ""
        correo = ""
        ciudad = ""
        
        
        if let idLugar = diccionario.value(forKey: "idNanny") as? Int{
            id = idLugar
            if let usuarioNanny = diccionario.value(forKey: "usuario") as? String{
                usuario = usuarioNanny
            }
            if let passwordNanny = diccionario.value(forKey: "password") as? String{
                password = passwordNanny
            }
            if let nombreNanny = diccionario.value(forKey: "nombre") as? String{
                nombre = nombreNanny
                print(nombre)
            }
            if let apellidoNanny = diccionario.value(forKey: "apellido") as? String{
                apellido = apellidoNanny
            }
            if let edadNanny = diccionario.value(forKey: "edad") as? String{
                edad = edadNanny
            }
            if let cargoNanny = diccionario.value(forKey: "ocupacion") as? String{
                cargo = cargoNanny
            }
            if let tiempoNanny = diccionario.value(forKey: "disponibilidad") as? String{
                tiempo = tiempoNanny
            }
            if let telefonoNanny = diccionario.value(forKey: "telefono") as? String{
                telefono = telefonoNanny
            }
            if let descripcionN = diccionario.value(forKey: "descripcion") as? String{
                descripcion = descripcionN
            }
            if let domicilioN = diccionario.value(forKey: "domicilio") as? String{
                domicilio = domicilioN
            }
            if let correoN = diccionario.value(forKey: "correo") as? String{
                correo = correoN
            }
            if let ciudadN = diccionario.value(forKey: "ciudad") as? String{
                ciudad = ciudadN
            }
            if let urlImagenPerfil = diccionario.value(forKey: "imgPerfil") as? String {
                fotoPerfil = urlImagenPerfil
                print("Tengo imagen")
                Alamofire.request("https://mynanny.azurewebsites.net/\(urlImagenPerfil)").responseData { response in
                    if let data = response.result.value {
                        print("Entro a alamo")
                        let image = UIImage(data: data)
                        self.imgPerfil = image
                        callback!()
                        print(data)
                    }
                    
                }
            }
            /*if let urlImagenP = diccionario.value(forKey: "imgPerfil") as? String{
                fotoPerfil = urlImagenP
                Alamofire.request("https://mynanny.azurewebsites.net/\(urlImagenP)", method: .get).responseData { response in
                    guard let image = response.result.value else {
                        // Handle error
                        return
                    }
                    // Do stuff with your image
                }
            }*/
            
            
        }
    }
    
}
