//
//  JaugeProgressionViewController.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import UIKit

class JaugeProgressionViewController: UIViewController {

    private var viewModel: JaugeProgressionViewModel!
    
    static func instantiate(viewModel : JaugeProgressionViewModel) -> JaugeProgressionViewController {
        let vc = UIStoryboard(name: "JaugeProgression", bundle: nil).instantiateViewController(withIdentifier: "JaugeProgressionViewController") as! JaugeProgressionViewController
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("jauge.progression.title", comment: "")
        // Do any additional setup after loading the view.
    }
}
