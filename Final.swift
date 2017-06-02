//
//  Final.swift
//  MyNanny
//
//  Created by Gabriela Perez on 31/05/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class Final : UIViewController{
    override func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: "goToInicio", sender: self)
        }
    }
}
