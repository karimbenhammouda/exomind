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
    
    @IBAction func showJaugeProgression(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JaugeProgression", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "JaugeProgressionViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

