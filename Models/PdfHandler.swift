//
//  PdfHandler.swift
//  GSDA
//
//  Created by Work on 10/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import UIKit

class PdfHandler: NSObject {
    
    var pdftitle: String?
    var pdfUrl: String?

override init(){}

    convenience init(pdfUrl: String, pdftitle: String)
{
    self.init()
    
    self.pdftitle = pdftitle
    self.pdfUrl = pdfUrl
}

}


