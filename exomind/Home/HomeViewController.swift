//
//  HomeViewController.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextButton.setRadius()
    }
}

