//
//  SelfConfiguringCell.swift
//  TapStore
//
//  Created by Paul Hudson on 01/10/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with app: App)
}

extension SelfConfiguringCell where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
