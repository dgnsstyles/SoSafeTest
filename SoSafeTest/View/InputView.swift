//
//  InputView.swift
//  SoSafeTest
//
//  Created by David Goren on 02-09-20.
//  Copyright © 2020 David Goren. All rights reserved.
//

import UIKit

class InputView: UIView {
    
    // MARK: - Properties
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: <#T##String#>).withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backButton)
        backButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44, paddingLeft: 12, width: 24, height: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selector
    
    @objc func handleBackTapped() {
        print("DEBUG: handle back..")
    }
}
