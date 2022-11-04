//
//  CollectionMainView.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/04.
//

import UIKit

import SnapKit

class CollectionMainView: BaseView {
    
    let collectionView: UICollectionView = {
        
        func createLayout() -> UICollectionViewLayout {
            let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            let layout = UICollectionViewCompositionalLayout.list(using: config)
            
            return layout
        }
        
        let view = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: createLayout())
        view.translatesAutoresizingMaskIntoConstraints = true
        
        return view
    }()
    
    override func configureUI() {
        self.addSubview(collectionView)
    }
    
    override func setConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
