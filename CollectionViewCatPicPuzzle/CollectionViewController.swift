//
//  CollectionViewController.swift
//  CollectionViewCatPicPuzzle
//
//  Created by Benjamin Su on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.33, height: self.view.frame.width * 0.33)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let imageWhole = UIImage(named: "cats")
        print(imageWhole?.size.height)
        let imageWidth = (imageWhole!.size.width * 0.33)
        let imageHeight = (imageWhole!.size.height * 0.25)
        
        let left = imageWidth * CGFloat(indexPath.row % 3)
        let top = imageHeight * CGFloat(indexPath.row / 3)
        let bottom = imageHeight * CGFloat(3 - (indexPath.row / 3))
        let right = imageWidth * CGFloat(2 - (indexPath.row % 3))
        
        let imagePiece = imageWhole!.withAlignmentRectInsets(.init(top: top, left: left, bottom: bottom, right: right))
        
        cell.imageView.image = imagePiece
        
    
        return cell
    }


}
