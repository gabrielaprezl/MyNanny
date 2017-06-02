//
//  ViewController.swift
//  MyNanny
//
//  Created by Gabriela Perez on 25/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   /* @IBAction func doTapSignUp(_ sender: Any) {
        let parameters = [
            "correo" : txtfdUser.text!,
            "password" : txtfdPasswd.text!
        ]
        
        Alamofire.request("https://emilianotest.azurewebsites.net/api/login.php", method: .post, parameters: parameters).responseJSON { response in
            if let diccionario = response.result.value as? NSDictionary{
                if let exito = diccionario.value(forKey: "success") as? Int{
                    if exito == 1 {
                        let preferencias : UserDefaults = UserDefaults.standard
                        let diccionarioUsuario = diccionario.value(forKey: "usuario") as? NSDictionary
                        let idUsuario = diccionarioUsuario?.value(forKey: "idPadre") as? Int
                        let nombreUsuario = diccionarioUsuario?.value(forKey: "nombre") as? String
                        let correoUsuario = diccionarioUsuario?.value(forKey: "correo") as? String
                        
                        preferencias.set(1, forKey: "sesionIniciada")
                        preferencias.set(idUsuario, forKey: "idUsuario")
                        preferencias.set(nombreUsuario, forKey: "nombreUsuario")
                        preferencias.set(correoUsuario, forKey: "correoUsuario")
                        
                        preferencias.synchronize()
                        
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        let alerta = UIAlertController(title : "Inicio sesión", message: "No se pudo", preferredStyle: UIAlertControllerStyle.alert)
                        alerta.message = "Usuario y contraseña no coinciden"
                        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                        self.present(alerta, animated: true, completion: nil)
                    }
                } else{
                    let alerta = UIAlertController(title : "Inicio sesión", message: "No se pudo", preferredStyle: UIAlertControllerStyle.alert)
                    alerta.message = "No fue posible iniciar sesión"
                    alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                    self.present(alerta, animated: true, completion: nil)
                }
            } else{
                let alerta = UIAlertController(title: "Inicio sesión", message: "No se pudo", preferredStyle: UIAlertControllerStyle.alert)
                alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(alerta, animated: true, completion: nil)
            }
        }
    } */

    @IBOutlet weak var txtfdUser: UITextField!
    @IBOutlet weak var txtfdPasswd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let myColor : UIColor = UIColor
        txtfdUser.layer.borderColor = myColor.cgColor
        txtfdPasswd.layer.borderColor = myColor.cgColor*/
        
        txtfdUser.layer.borderWidth = 1.0
        txtfdPasswd.layer.borderWidth = 1.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

