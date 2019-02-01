//
//  ScheduleViewController.swift
//  GSDA
//
//  Created by Joriah Lasater on 2/1/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
import JTAppleCalendar

final class ScheduleViewController: UIViewController {
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "January"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var calenderView: JTAppleCalendarView = {
        let cView = JTAppleCalendarView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = .white
        cView.register(DayCell.self, forCellWithReuseIdentifier: "cell")
        cView.isPagingEnabled = true
        cView.scrollDirection = .horizontal
        cView.isScrollEnabled = true
        cView.calendarDelegate = self
        cView.calendarDataSource = self
        cView.scrollingMode = .stopAtEachCalendarFrame
        return cView
    }()
    
    let dayNames = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var dayLabels: [UILabel] {
        var result: [UILabel] = []
        dayNames.forEach {
            let dayLabel = UILabel()
            dayLabel.text = $0
            dayLabel.textColor = .black
            dayLabel.backgroundColor = .blue
            result.append(dayLabel)
        }
        return result
    }
    
    lazy var daysStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: dayLabels)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    lazy var mainMenuButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Main Menu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleMainMenu), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        return button
    }()
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        setupSubViews()
        view.backgroundColor = .white
        updateCalenderLabel(date: Date())
    }
}

private extension ScheduleViewController {
    
    @objc func handleMainMenu() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupSubViews() {
        view.addSubview(calenderView)
        view.addSubview(mainMenuButton)
        view.addSubview(monthLabel)
        view.addSubview(daysStackView)
        
        monthLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        monthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        monthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        daysStackView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor).isActive = true
        daysStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        daysStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        daysStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        calenderView.topAnchor.constraint(equalTo: daysStackView.bottomAnchor).isActive = true
        calenderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        calenderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        calenderView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        mainMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
    }
}

extension ScheduleViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        // Check documentation
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        if let cell = calenderView.dequeueReusableJTAppleCell(withReuseIdentifier: "cell", for: indexPath) as? DayCell {
            cell.setup()
            cell.dateLabel.text = cellState.text
            return cell
        }
        
        return JTAppleCell()
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        guard let date = visibleDates.monthDates.last?.date else {
            return
        }
        updateCalenderLabel(date: date)
    }
    
    func updateCalenderLabel(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        monthLabel.text = dateFormatter.string(from: date)
    }
}
