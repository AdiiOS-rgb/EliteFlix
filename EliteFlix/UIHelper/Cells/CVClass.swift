//
//  CVClass.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

struct SetLayout {
    let scrollDirection: UICollectionView.ScrollDirection
    let itemSize: CGSize
    let sectionInset: UIEdgeInsets
    let minimumLineSpaceing: CGFloat
    let minimumInteritemSpacing: CGFloat
}

class CVClass: UICollectionView {
    var numsOfSection: Int = 0

    init(layout: SetLayout, sections: Int) {
        
        let CLayout = UICollectionViewFlowLayout()
        CLayout.scrollDirection = layout.scrollDirection
        CLayout.itemSize = layout.itemSize
        CLayout.sectionInset = layout.sectionInset
        CLayout.minimumLineSpacing = layout.minimumLineSpaceing
        CLayout.minimumInteritemSpacing = layout.minimumInteritemSpacing
        
        super.init(frame: .zero, collectionViewLayout: CLayout)
        super.showsHorizontalScrollIndicator = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
