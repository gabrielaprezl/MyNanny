//
//  DetalleNanny.swift
//  MyNanny
//
//  Created by Gabriela Perez on 28/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class DetalleNanny : UIViewController, MFMessageComposeViewControllerDelegate {
    @IBOutlet weak var imgPerfil: UIImageView!
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblEdad: UILabel!
    @IBOutlet weak var lblCargo: UILabel!
    @IBOutlet weak var lblTiempo: UILabel!
    @IBOutlet weak var txtDescripcion: UITextView!
    @IBOutlet weak var imgDNI: UIImageView!
    @IBOutlet weak var imgAddress: UIImageView!
    @IBOutlet weak var imgMedical: UIImageView!
    @IBOutlet weak var imgDriver: UIImageView!
    
    
    
    
    @IBAction func doTapTotal(_ sender: Any) {
        performSegue(withIdentifier: "goToTotal", sender: self)
    }
    
    @IBAction func callNanny(_ sender: Any) {
        let n = nanny
        let url = URL(string: "tel://" + (n?.telefono)!)!
        UIApplication.shared.openURL(url)
        print("LLAMA")
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func messageNanny(_ sender: Any) {
        let n = nanny
        if MFMessageComposeViewController.canSendText(){
            let controller = MFMessageComposeViewController()
            controller.body = ""
            controller.recipients = [(n?.telefono)!]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        } else {
            print("en cel real :3")
        }
    }
    
    
    
    var detalleNanny = [Nanny]()
    var nannys : [Nanny] = []
    var nanny : Nanny?
    
    var nannyRequest : NannyRequest?
    var tiempoRequest : ValorTiempo?
    
    override func viewDidLoad() {
        
        let s = nanny
        
        let noTiene = UIImage(named: "cancel")
        let siTiene = UIImage(named: "checked")
        
        lblNombre.text = s?.nombre
        lblCargo.text = s?.cargo
        lblEdad.text = s?.edad
        lblTiempo.text = s?.tiempo
        imgPerfil.image = s?.imgPerfil
        txtDescripcion.text = s?.descripcion
        
        //VALIDACION DOCUMENTACION
        
        //CREDENCIAL INE
        if(s?.imgINE == nil){
            imgDNI.image=UIImage(named: "cancel")!
            imgDNI.image=noTiene
            print("no hay")

        } else{
            imgDNI.image=UIImage(named: "checked")
            imgDNI.image=siTiene
            print("si hay")
        }
        //EXAMEN MEDICO
        if(s?.imgExamenM == nil){
            imgMedical.image=UIImage(named: "cancel")!
            imgMedical.image=noTiene
            print("no hay")
            
        } else{
            imgMedical.image=UIImage(named: "checked")
            imgMedical.image=siTiene
            print("si hay")
        }
        //LICENCIA DE CONDUCIR
        if(s?.imgLicencia == nil){
            imgDriver.image=UIImage(named: "cancel")!
            imgDriver.image=noTiene
            print("no hay")
            
        } else{
            imgDriver.image=UIImage(named: "checked")
            imgDriver.image=siTiene
            print("si hay")
        }
        //DIRECCION
        if(s?.domicilio == nil){
            imgAddress.image=UIImage(named: "cancel")!
            imgAddress.image=noTiene
            print("no hay")
            
        } else{
            imgAddress.image=UIImage(named: "checked")
            imgAddress.image=siTiene
            print("si hay")
        }
        
        //lblNombre.text =
        let nr = nannyRequest
        let tr = tiempoRequest
        print(tr?.precio ?? "")
        print(nr?.meals ?? "")
        print(s?.nombre ?? "")
        /*
        let nanny = detalleNanny[0]
        lblNombre.text = nanny.nombre
        lblEdad.text = nanny.edad
        lblTiempo.text = nanny.tiempo
        lblCargo.text = nanny.cargo */
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTotal"{
            let destino = segue.destination as? Total
            destino?.nannyRequest = nannyRequest
            destino?.tiempoRequest = tiempoRequest
            destino?.nanny = nanny
            //destino.totalNanny = [sender as! ]
            
            
        }
    }
    
}
