//
//  NumberView.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/03.
//

import UIKit

import SnapKit

final class NumberView: BaseView {
    
    let textField1: UITextField = {
        let view = UITextField()
        view.backgroundColor = .systemCyan
        return view
    }()
    
    let textField2: UITextField = {
        let view = UITextField()
        view.backgroundColor = .systemCyan
        return view
    }()
    
    let textField3: UITextField = {
        let view = UITextField()
        view.backgroundColor = .systemCyan
        return view
    }()
    
    let boundaryLine: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let plusLabel: UILabel = {
        let view = UILabel()
        view.text = " + "
        view.backgroundColor = .systemCyan
        return view
    }()
    
    let label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .systemCyan
        view.text = "test"
        return view
    }()
    
    override func configureUI() {
        [textField1, textField2, textField3, boundaryLine, plusLabel, label].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        textField2.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        textField1.snp.makeConstraints { make in
            make.bottom.equalTo(textField2.snp.top).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        textField3.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        plusLabel.snp.makeConstraints { make in
            make.trailing.equalTo(textField3.snp.leading).offset(-20)
            make.bottom.equalTo(boundaryLine.snp.top).offset(-20)
            make.size.equalTo(40)
        }
        
        boundaryLine.snp.makeConstraints { make in
            make.top.equalTo(textField3.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalTo(300)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(boundaryLine.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
}
