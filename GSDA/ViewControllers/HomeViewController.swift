//
//  HomeViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/10/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import AVFoundation
import UIKit

final class HomeViewController: UIViewController {
    
    let programInformation = SchoolMaterialButtonView(title: "PROGRAM INFORMATION", image: UIImage(named: "program_information"), viewController: ProgramInfoViewController())
    let locations = SchoolMaterialButtonView(title: "LOCATIONS", image: UIImage(named: "locations"), viewController: LocationsViewController())
    let expandedDuty = SchoolMaterialButtonView(title: "EXPANDED DUTY", image: UIImage(named: "expanded_duty"), viewController: ExpandedDutyViewController())
    let classSchedule = SchoolMaterialButtonView(title: "CLASS SCHEDULE", image: UIImage(named: "class_schedule"), viewController: ScheduleViewController())
    
    lazy var views: [SchoolMaterialButtonView] = [programInformation, locations, classSchedule, expandedDuty]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "HOME"
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
        view.addSubview(programInformation)
        view.addSubview(locations)
        view.addSubview(expandedDuty)
        view.addSubview(classSchedule)
        
        let padding: CGFloat = 75
        
        programInformation.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -padding).isActive = true
        programInformation.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -padding).isActive = true
        
        locations.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: padding).isActive = true
        locations.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -padding).isActive = true
        
        expandedDuty.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -padding).isActive = true
        expandedDuty.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: padding).isActive = true
        
        classSchedule.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: padding).isActive = true
        classSchedule.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: padding).isActive = true
        
    }
}


