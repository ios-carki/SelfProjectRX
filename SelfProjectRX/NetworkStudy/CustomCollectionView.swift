//
//  CustomCollectionView.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/04.
//

import UIKit

import SnapKit

class CustomCollectionView: UICollectionViewCell {
    
    static let identifier = "Cell"
    
    let likesLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .green
        return view
    }()
    
    let searchImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .green
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(likesLabel)
        contentView.addSubview(searchImage)
    }
    
    private func setLayout() {
        
        likesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        searchImage.snp.makeConstraints { make in
            make.top.equalTo(likesLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(200)
        }
    }
}
