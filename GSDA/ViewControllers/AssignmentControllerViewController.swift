//
//  AssignmentControllerViewController.swift
//  GSDA
//
//  Created by Work on 07/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class AssignmentControllerViewController: AssignmentViewController, AssignmentTableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        PdfApi.observePosts(of: "assignments"){ (post) in
            self.posts.append(post)
            self.feedTableView.reloadData()
        }
        titleLbl.text = "Pdf"
        tableViewDelegate = self

        // Do any additional setup after loading the view.
    }
    
    func upload() {
        present(UploadPdfViewController(), animated: true, completion: nil)
    }
    
    func didTap(cell: AssignmentCell) {
       let webview = UIWebView()
        guard let pdfURLString = cell.post?.pdfUrl, let pdfUrl = URL(string: pdfURLString) else {
            return
    }
        webview.loadRequest(pdfURLString)
        present(webview, animated: true, completion: nil)

}

}
