//
//  LabelLoadingView.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 09/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class LabelLoadingView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    
    // MARK: - Properties
    
    weak var delegate: SwitchTextDelegate?
    
    private var serviceResponse: ServiceResponse?
    
    // MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(serviceResponse: ServiceResponse) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
        commonInit()
        
        self.serviceResponse = serviceResponse
        
        titleLabel.text = serviceResponse.request.getServiceName()
        handleState(serviceResponse.status)
        
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LabelLoadingView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth]
        
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func handleState(_ state: RequestState) {
        activityIndicator.isHidden = true
        activityIndicator.startAnimating()
        viewButton.isHidden = true
        tryAgainButton.isHidden = true
        
        switch state {
        case .success:
            viewButton.isHidden = false
        case .loading:
            activityIndicator.isHidden = false
        case .error:
            tryAgainButton.isHidden = false
        }
    }
    
    @IBAction func tryAgainAct(_ sender: Any) {
        serviceResponse?.tryAgainAction?()
    }
    
}
