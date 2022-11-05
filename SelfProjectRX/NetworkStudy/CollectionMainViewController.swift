//
//  CollectionMainViewController.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/04.
//

import UIKit

import Kingfisher

final class CollectionMainViewController: UIViewController {
    
    let mainView = CollectionMainView()
    let apiService = APIService()
    
    let testLikes = ["1", "2", "3", "4"]
    let testImages = [UIImage(systemName: "star"), UIImage(systemName: "star"), UIImage(systemName: "star"), UIImage(systemName: "star")]
    
    var netLikes: [MyData] = []
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionSetting()
        
        APIService().netWorkSetting { [weak self] data in
            self?.netLikes = data
            self?.mainView.collectionView.reloadData()
            //netlikes = data
        }
    }
    
    func collectionSetting() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.register(CustomCollectionView.self, forCellWithReuseIdentifier: CustomCollectionView.identifier)
        
    }
    
}

extension CollectionMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return netLikes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionView.identifier, for: indexPath) as! CustomCollectionView
        
        cell.likesLabel.text = netLikes[indexPath.item].name
        cell.searchImage.kf.setImage(with: URL(string: netLikes[indexPath.item].photo))
        return cell
    }
    
    
}
