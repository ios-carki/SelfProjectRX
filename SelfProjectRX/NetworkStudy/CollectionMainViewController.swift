//
//  CollectionMainViewController.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/04.
//

import UIKit

class CollectionMainViewController: UIViewController {
    
    let mainView = CollectionMainView()
    
    let testLikes = ["1", "2", "3", "4"]
    let testImages = [UIImage(systemName: "star"), UIImage(systemName: "star"), UIImage(systemName: "star"), UIImage(systemName: "star")]
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionSetting()
    }
    
    func collectionSetting() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.register(CustomCollectionView.self, forCellWithReuseIdentifier: CustomCollectionView.identifier)
    }
}

extension CollectionMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testLikes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionView.identifier, for: indexPath) as! CustomCollectionView
        
        cell.likesLabel.text = testLikes[indexPath.item]
        cell.searchImage.image = testImages[indexPath.item]
        
        return cell
    }
    
    
}
