//
//  UICollectionView+ReusableIdenfifier.swift
//  TapStore
//
//  Created by Marcel Mravec on 15.05.2024.
//  Copyright © 2024 Hacking with Swift. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: SelfConfiguringCell {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UICollectionViewCell>(_: T.Type, forSupplementaryViewOfKind: String) where T: SelfConfiguringCell {
        register(
            T.self,
            forSupplementaryViewOfKind: forSupplementaryViewOfKind,
            withReuseIdentifier: T.reuseIdentifier
        )
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: SelfConfiguringCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Cell with identifier: \(T.reuseIdentifier) could not be dequeued!")
        }
        
        return cell
    }
    
    func dequeueSupplementaryView<T: UICollectionViewCell>(ofKind: String, for indexPath: IndexPath) -> T where T: SelfConfiguringCell {
        guard let cell = dequeueReusableSupplementaryView(
            ofKind: ofKind,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("SupplementaryView with identifier: \(T.reuseIdentifier) could not be dequeued!")
        }
        
        return cell
    }
}
