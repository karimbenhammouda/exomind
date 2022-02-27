//
//  CityTableViewCell.swift
//  exomind
//
//  Created by Karim BEN HAMMOUDA on 27/02/2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityValueLabel: UILabel!
    
    var viewModel: CityTableViewModel? {
        didSet {
            setup()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        guard let viewModel = viewModel, let name = viewModel.name, let value = viewModel.value  else {
            return
        }
        
        cityNameLabel.text = name
        cityValueLabel.text = String(value)
    }
    
}
