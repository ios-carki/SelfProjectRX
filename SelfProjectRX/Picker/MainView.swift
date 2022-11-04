//
//  MainView.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/03.
//
import UIKit

import SnapKit

class MainView: UIView {
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 0
        return view
    }()
    
    let pickerView1: UIPickerView = {
        let view = UIPickerView()
        return view
    }()
    
    let pickerView2: UIPickerView = {
        let view = UIPickerView()
        
        return view
    }()
    
    let pickerView3: UIPickerView = {
        let view = UIPickerView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
        [pickerView1, pickerView2, pickerView3].map {
            stackView.addArrangedSubview($0)
        }
        
        self.addSubview(stackView)
    }
    
    func setConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
    }
}
