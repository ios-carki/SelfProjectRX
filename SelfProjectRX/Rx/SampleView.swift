//
//  SampleView.swift
//  SelfProjectRX
//
//  Created by Carki on 2023/01/11.
//

import UIKit

import SnapKit

final class SampleView: BaseView {
    
    let sampleTextField: UITextField = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 14)
        view.textColor = .black
        view.backgroundColor = .lightGray
        view.placeholder = "아이디를 입력하세요"
        return view
    }()
    
    let sample2TextField: UITextField = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 14)
        view.textColor = .black
        view.backgroundColor = .lightGray
        view.placeholder = "비밀번호를 입력하세요"
        return view
    }()
    
    let sampleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .lightGray
        view.textColor = .black
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    let sampleButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .gray
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.setTitle("버튼", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.isEnabled = false
        return view
    }()
    
    let sampleImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func configureUI() {
        [sampleTextField, sample2TextField, sampleLabel, sampleButton, sampleImageView].forEach {
            self.addSubview($0)
        }
        self.backgroundColor = .white
    }
    
    override func setConstraints() {
        
        sampleTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        sample2TextField.snp.makeConstraints { make in
            make.top.equalTo(sampleTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        sampleLabel.snp.makeConstraints { make in
            make.top.equalTo(sample2TextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        sampleButton.snp.makeConstraints { make in
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(60)
        }
        
        sampleImageView.snp.makeConstraints { make in
            make.top.equalTo(sampleButton.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
        }
    }
}
