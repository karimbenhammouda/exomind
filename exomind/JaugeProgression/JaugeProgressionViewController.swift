//
//  JaugeProgressionViewController.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import UIKit

class JaugeProgressionViewController: UIViewController {

    private var viewModel: JaugeProgressionViewModel!
    private var timer1: Timer!
    private var timer2: Timer!
    
    @IBOutlet weak var waitUserLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var ressetButton: UIButton!
    
    static func instantiate(viewModel : JaugeProgressionViewModel) -> JaugeProgressionViewController {
        let vc = UIStoryboard(name: "JaugeProgression", bundle: nil).instantiateViewController(withIdentifier: "JaugeProgressionViewController") as! JaugeProgressionViewController
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("jauge.progression.title", comment: "")
        viewModel.delegate = self
        tableView.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
        tableView.isHidden = true
        ressetButton.isHidden = true
        ressetButton.setTitle("Reset", for: .normal)
        ressetButton.setRadius()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressBarView.trackTintColor = .gray
        progressBarView.progressTintColor = .red
        waitUserLabel.text = viewModel.waitUser[0]
        setupTimer()
        setprogressBar()
    }
    
    func setupTimer() {
        timer1 = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(waitUser), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(waitCity), userInfo: nil, repeats: true)
    }
    
    @objc func waitUser() {
        waitUserLabel.text = viewModel.waitUserText()
    }
    
    @objc func waitCity() {
        if viewModel.indexMapsCity != viewModel.mapsCity.count {
            let city = viewModel.mapsCity[viewModel.indexMapsCity]
            let cityLatitude = city[0]
            let cityLongitude = city[1]
            let latitude = cityLatitude["lat"]
            let longitude = cityLongitude["lon"]
            viewModel.getData(latitude, longitude)
            viewModel.indexMapsCity += 1
        }
    }
    
    func setprogressBar() {
        UIView.animate(withDuration: 50, delay: 0, animations: {
            self.progressBarView.setProgress(1.0, animated: true)
        })
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        progressBarView.progress = 0
        setprogressBar()
        progressBarView.isHidden = false
        waitUserLabel.isHidden = false
        tableView.isHidden = true
        ressetButton.isHidden = true
        viewModel.waitCity.removeAll()
        viewModel.indexMapsCity = 0
        setupTimer()
    }
}

extension JaugeProgressionViewController: JaugeProgressionViewModelDelegate {
    func updateUI() {
        progressBarView.isHidden = true
        waitUserLabel.isHidden = true
        tableView.isHidden = false
        ressetButton.isHidden = false
        timer1.invalidate()
        timer2.invalidate()
        tableView.reloadData()
    }
}

extension JaugeProgressionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.waitCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = CityTableViewModel(name: viewModel.waitCity[indexPath.row]?.name, value: viewModel.waitCity[indexPath.row]?.wind.deg)
        return cell
    }
}

extension JaugeProgressionViewController: UITableViewDelegate {}
