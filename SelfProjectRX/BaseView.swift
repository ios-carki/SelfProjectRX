//
//  BaseView.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/03.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
    }
    
    func setConstraints() {
    }
}
