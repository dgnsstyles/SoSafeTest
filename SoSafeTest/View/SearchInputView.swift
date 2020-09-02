//
//  SearchInputView.swift
//  SoSafeTest
//
//  Created by David Goren on 02-09-20.
//  Copyright © 2020 David Goren. All rights reserved.
//

import UIKit

protocol SearchInputActivationViewDelegate: class {
    func presentSearchInputView()
}

class SearchInputView: UIView {
    // MARK: - Properties
    
    weak var delegate: SearchInputActivationViewDelegate?
    private let indicationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Buscar Lugar"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.55
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
        addSubview(indicationView)
        indicationView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicationView.setDimensions(height: 6, width: 6)
        
        addSubview(placeholderLabel)
        placeholderLabel.centerY(inView: self, leftAnchor: indicationView.rightAnchor, paddingLeft: 20)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentShowSearchInputView))
        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func presentShowSearchInputView() {
        print(123)
    }
}
