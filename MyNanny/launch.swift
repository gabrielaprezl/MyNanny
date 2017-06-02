//
//  launch.swift
//  MyNanny
//
//  Created by Gabriela Perez on 01/06/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit

class Launch: UIViewController{
    
    
    
    @IBOutlet weak var imgLaunch1: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let nombreAnimaciones = ["sl_00", "sl_01", "sl_02", "sl_03", "sl_04", "sl_05", "sl_06", "sl_07", "sl_08", "sl_09", "sl_10", "sl_11", "sl_12", "sl_13", "sl_14", "sl_15", "sl_16", "sl_17", "sl_18", "sl_19", "sl_20", "sl_21"]
        var arregloImg : [UIImage] = []
        
        for nombreAnimacion in nombreAnimaciones{
            arregloImg.append(UIImage(named: nombreAnimacion)!)
        }
        
        imgLaunch1.image = arregloImg[21]
        imgLaunch1.animationImages = arregloImg
        
        imgLaunch1.animationDuration = 1.0
        
        imgLaunch1.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: "goToMenu", sender: self)
        }
    }
}
