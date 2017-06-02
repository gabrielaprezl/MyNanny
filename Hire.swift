
//
//  Hire.swift
//  MyNanny
//
//  Created by Gabriela Perez on 01/06/17.
//  Copyright © 2017 Gabriela Perez. All rights reserved.
//

import Foundation
import UIKit

class HireNanny: ViewController {
    override func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: "goToInicio2", sender: self)
        }
    }
}
