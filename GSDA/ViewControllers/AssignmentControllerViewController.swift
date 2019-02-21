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

        // Do any additional setup after loading the view.
    }
    
    func upload() {
        present(PdfUploadViewController(), animated: true, completion: nil)
    }
    
    func didTap(cell: AssignmentCell) {
        _ = UIWebView()
    }

}
