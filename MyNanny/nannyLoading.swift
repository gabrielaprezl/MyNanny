//
//  nannyLoading.swift
//  MyNanny
//
//  Created by Gabriela Perez on 27/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit

class NannyLoading : UIViewController {
    
    @IBOutlet weak var loadingAnimation: UIImageView!
    
    var nannyRequest : NannyRequest?
    var tiempoRequest : ValorTiempo?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let nombreAnimaciones = ["n1", "n2", "n3", "n4", "n5", "n6", "n7", "n8", "n9", "n10", "n11", "n12", "n13", "n14", "n15", "n16", "n17", "n18", "n19", "n20", "n21", "n22", "n23", "n24", "n25", "n26"]
        var arregloImg : [UIImage] = []
        
        for nombreAnimacion in nombreAnimaciones{
            arregloImg.append(UIImage(named: nombreAnimacion)!)
        }
        
        loadingAnimation.image = arregloImg[25]
        loadingAnimation.animationImages = arregloImg
        
        loadingAnimation.animationDuration = 1.0
        
        loadingAnimation.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { 
            self.performSegue(withIdentifier: "goToTablas", sender: self)
        }
        
        let nr = nannyRequest
        let tr = tiempoRequest
        print(tr?.precio ?? "")
        print(nr?.meals ?? "")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTablas"{
            let destino = segue.destination as? NannyController
            destino?.nannyRequest = nannyRequest
            destino?.tiempoRequest = tiempoRequest

        }
    }

}
