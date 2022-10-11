//
//  UICollectionView+Register.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UICollectionView {
    enum SectionViewKind {
        case header, footer
        
        var element: String {
            switch self {
            case .header:   return UICollectionView.elementKindSectionHeader
            case .footer:   return UICollectionView.elementKindSectionFooter
            }
        }
    }
    
    func register(_ cell: UICollectionViewCell.Type) {
        let identifier = String(describing: cell.self)
        self.register(cell, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueReusable<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cell.self), for: indexPath) as! T
    }
    
    func register(_ view: UICollectionReusableView.Type, ofKind kind: SectionViewKind) {
        let identifier = String(describing: view.self)
        return self.register(view, forSupplementaryViewOfKind: kind.element, withReuseIdentifier: identifier)
    }
    
    func dequeueReusable<T: UICollectionReusableView>(_ view: T.Type, ofKind kind: SectionViewKind, for indexPath: IndexPath) -> T {
        let identifier = String(describing: view.self)
        return dequeueReusableSupplementaryView(ofKind: kind.element, withReuseIdentifier: identifier, for: indexPath) as! T
    }
}

extension UICollectionView {
    /// 預設 sectino = 0, animated = true
    func selectItem(at row: Int) {
        selectItem(at: row, animated: true)
    }
    
    /// 預設 sectino = 0
    func selectItem(at row: Int, animated: Bool) {
        let indexPath = IndexPath(row: row, section: 0)
        selectItem(at: indexPath, animated: animated, scrollPosition: .init())
    }
}
