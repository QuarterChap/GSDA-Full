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
        titleLbl.text = "Pdf"
        tableViewDelegate = self
        fetchPostPdf()
    }
    
    func upload() {
        present(PdfUploadViewController(), animated: true, completion: nil)
    }
    
    func didTap(cell: AssignmentCell) {
        present(GSDACatalogViewController().configured {
         $0.url = cell.post?.pdf_url
        }, animated: true)
    }
    
    func fetchPostPdf() {
        // Do any additional setup after loading the view.
        AssignmentsApi().observePdfPosts { (model) in
            self.posts.append(model)
            self.feedTableView.reloadData()
        }
    }
}
