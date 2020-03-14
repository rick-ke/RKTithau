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
    }
    
    func register(cell: AnyClass?) {
        let cellType = cell as? NSObject.Type
        let cellName = cellType?.className ?? ""
        self.register(cell, forCellWithReuseIdentifier: cellName)
    }
    
    func register(cells: [AnyClass?]) {
        cells.forEach { register(cell: $0) }
    }
    
    func reusable(cell: AnyClass, for indexPath: IndexPath) -> UICollectionViewCell? {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cell.self), for: indexPath)
    }
    
    func register(view: AnyClass?, kind: SectionViewKind) {
        let viewType = view as? NSObject.Type
        let viewName = viewType?.className ?? ""
        switch kind {
        case .header:
            self.register(view, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: viewName)
        case .footer:
            self.register(view, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: viewName)
        }
    }
    
    func reusable(view: AnyClass, kind: SectionViewKind, for indexPath: IndexPath) -> UICollectionReusableView {
        let identifier = String(describing: view.self)
        switch kind {
        case .header:
            return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath)
        case .footer:
            return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier, for: indexPath)
        }
    }
}
