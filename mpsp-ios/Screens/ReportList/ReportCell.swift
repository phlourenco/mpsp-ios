//
//  ReportCell.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 23/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class ReportCell: ConfigurableCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Methods

    override func configure(viewModel: CellViewModel, delegate: Any?) {
        guard let viewModel = viewModel as? ReportCellViewModel else { return }
        
        titleLabel.text = viewModel.title
        if let subtitle = viewModel.subtitle {
            subtitleLabel.isHidden = false
            subtitleLabel.text = subtitle
        } else {
            subtitleLabel.isHidden = true
        }
        
    }

}
