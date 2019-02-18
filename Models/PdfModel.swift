//
//  PdfModel.swift
//  GSDA
//
//  Created by Work on 17/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation

struct PdfModel {
    var uid: String?
    var description: String?
    var title: String?
    var pdfUrl: String?
}


extension PdfModel {
    static func transformPdf(dict: [String: Any], key: String) -> PdfModel {
        let pdfPost = PdfModel()
        pdfPost.id = key
        pdfPost.title = dict["title"] as? String
        pdfPost.description = dict["description"] as? String
        pdfPost.uid = dict["uid"] as? String
        pdfPost.pdfUrl = dict["pdfUrl"] as? String
        
        return pdfPost
    }
}
