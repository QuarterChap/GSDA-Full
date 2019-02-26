//
//  PdfModel.swift
//  GSDA
//
//  Created by langsemJobb on 19/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseAuth

class PdfModel {
    
    var description: String?
    var uid: String?
    var id: String?
    var pdf_url: String?
    var title: String?
    var timestamp: String?
}

extension PdfModel {
    static func transformPdf(dict: [String: Any], key: String) -> PdfModel {
        let push = PdfModel()
        push.id = key
        push.title = dict["title"] as? String
        push.description = dict["description"] as? String
        push.pdf_url = dict["pdf_url"] as? String
        push.uid = dict["uid"] as? String
        push.timestamp = dict["timestamp"] as? String
        
        return push
    }
}
