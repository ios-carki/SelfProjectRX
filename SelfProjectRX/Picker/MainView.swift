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
    
    let tableView: UITableView = {
        let view = UITableView()
        
        return view
    }()
    
    let testLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    let testSwitch: UISwitch = {
        let view = UISwitch()
        
        return view
    }()
    
    let testTextField1: UITextField = {
        let view = UITextField()
        view.backgroundColor = .brown
        view.placeholder = "텍필1"
        return view
    }()
    
    let testTextField2: UITextField = {
        let view = UITextField()
        view.backgroundColor = .yellow
        view.placeholder = "텍필2"
        return view
    }()
    
    let testButton: UIButton = {
        let view = UIButton()
        view.setTitle("버튼", for: .normal)
        view.backgroundColor = .red
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
//        [pickerView1, tableView, testSwitch, testLabel].map {
//            stackView.addArrangedSubview($0)
//        }
//        [testTextField1, testTextField2, testButton, testLabel].map {
//            stackView.addArrangedSubview($0)
//        }
        
        [testTextField1, testTextField2, testButton, testLabel].forEach {
            self.addSubview($0)
        }
        
        //self.addSubview(stackView)
    }
    
    func setConstraints() {
        
//        stackView.snp.makeConstraints { make in
//            make.edges.equalTo(safeAreaLayoutGuide)
//        }
        
        testTextField1.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
        }
        
        testTextField2.snp.makeConstraints { make in
            make.top.equalTo(testTextField1.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
        }
        
        testButton.snp.makeConstraints { make in
            make.top.equalTo(testTextField2.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
        }
        
        testLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
//        tableView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.horizontalEdges.equalToSuperview()
//        }
//
//        pickerView1.snp.makeConstraints { make in
//            make.top.equalTo(tableView.snp.bottom)
//            make.horizontalEdges.equalToSuperview()
//        }
        
    }
}
