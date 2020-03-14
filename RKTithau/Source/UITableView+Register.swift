//
//  UITableView+Register.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UITableView {
    func register(cell: AnyClass?) {
        let cellType = cell as? NSObject.Type
        let cellName = cellType?.className ?? ""
        self.register(cell, forCellReuseIdentifier: cellName)
    }
    
    func register(cells: [AnyClass?]) {
        cells.forEach { register(cell: $0) }
    }
    
    func reusable<T: Any>(cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: cell.self), for: indexPath) as! T
    }
}
