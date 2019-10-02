//
//  SchoolMaterialViewController.swift
//  GSDA
//
//  Created by Joriah Lasater on 3/7/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class SchoolMaterialButtonView: UIView, UIGestureRecognizerDelegate {
    
    lazy var button = UIButton().configured {
        $0.setImage(image, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var titleLabel = UILabel().configured {
        $0.text = title
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = .myBlue
        $0.lineBreakMode = .byWordWrapping
    }

    var image: UIImage!
    var title: String!
    var viewController: UIViewController!
    
    init(title: String, image: UIImage?, viewController: UIViewController) {
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height:100))
        self.image = image
        self.title = title
        self.viewController = viewController
        setupViews()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupViews() {
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        widthAnchor.constraint(equalToConstant: 90).isActive = true

        addSubview(button)
        addSubview(titleLabel)
        
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class SchoolMaterialViewController: UIViewController {
    
    let assignmentsView = SchoolMaterialButtonView(title: "ASSIGNMENTS MATERIAL", image: UIImage(named: "assignments"), viewController: AssignmentViewController())
    let courseMaterialView = SchoolMaterialButtonView(title: "COURSE MATERIAL", image: UIImage(named: "course_material"), viewController: CourseMaterialViewController())
    let instructionalVideos = SchoolMaterialButtonView(title: "INSTRUCTIONAL VIDEOS", image: UIImage(named: "videos-1"), viewController: VideosViewController())
    let instructionalPhotos = SchoolMaterialButtonView(title: "INSTRUCTIONAL PHOTOS", image: UIImage(named: "photos-1"), viewController: PhotosViewController())
    
    lazy var views: [SchoolMaterialButtonView] = [assignmentsView, courseMaterialView, instructionalPhotos, instructionalVideos]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "SCHOOL MATERIAL"
        view.backgroundColor = .white
        
        views.forEach {
            $0.button.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside)
        }
    }
    
    @objc func buttonPressed(button: UIButton) {
        for view in views {
            if view.button == button {
                navigationController?.pushViewController(view.viewController, animated: true)
            }
        }
    }
    
    func setupViews() {
        view.addSubview(assignmentsView)
        view.addSubview(courseMaterialView)
        view.addSubview(instructionalVideos)
        view.addSubview(instructionalPhotos)
        
        let padding: CGFloat = 75
        
        assignmentsView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -padding).isActive = true
        assignmentsView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -padding).isActive = true
        
        courseMaterialView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: padding).isActive = true
        courseMaterialView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -padding).isActive = true
        
        instructionalVideos.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -padding).isActive = true
        instructionalVideos.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: padding).isActive = true
        
        instructionalPhotos.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: padding).isActive = true
        instructionalPhotos.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: padding).isActive = true
        
    }
}
