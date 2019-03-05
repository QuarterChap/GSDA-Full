//
//  PdfModel.swift
//  GSDA
//
//  Created by langsemJobb on 19/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseAuth

struct PdfModel {
    var description: String
    var uid: String
    var pdf_url: String
    var title: String
}

extension PdfModel {
    static func transformPdf(dict: [String: Any], uid: String) -> PdfModel {
        
        guard let title = dict["title"] as? String,
        let description = dict["description"] as? String,
        let pdf_url = dict["pdf_url"] as? String else {
            return PdfModel(description: "", uid: "", pdf_url: "", title: "")
        }
        return PdfModel(description: description, uid: uid, pdf_url: pdf_url, title: title)
    }
}
