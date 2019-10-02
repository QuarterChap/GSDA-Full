//
//  Configurable.swift
//  GSDA
//
//  Created by Julian Cearley on 2/22/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

protocol Configurable {}

extension Configurable {
    func configured(using configurationHandler: (Self) -> Void) -> Self {
        configurationHandler(self)
        return self
    }
}

extension UIView: Configurable {}
extension UIViewController: Configurable {}
