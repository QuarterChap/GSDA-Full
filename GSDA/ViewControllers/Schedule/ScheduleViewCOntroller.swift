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
    
    var currentDate: Date!
    
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
    
    let dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var daysWithNotes = [Date]()

    var dayLabels: [UILabel] {
        var result: [UILabel] = []
        dayNames.forEach {
            let dayLabel = UILabel()
            dayLabel.text = $0
            dayLabel.font = UIFont.boldSystemFont(ofSize: 15)
            dayLabel.textColor = .white
            dayLabel.backgroundColor = .customBlue
            dayLabel.textAlignment = .center
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
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2019"
        label.textAlignment = .center
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("<---", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("--->", for: .normal)
        button.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    @objc func leftButtonPressed() {
        guard let date = Calendar.current.date(byAdding: .year, value: -1, to: currentDate) else {
            return
        }
        if date < startDate {
            return
        }
        
        calenderView.scrollToDate(date)
        updateYearLabel(date: date)
        currentDate = date
    }
    
    @objc func rightButtonPressed() {
        guard let date = Calendar.current.date(byAdding: .year, value: 1, to: currentDate) else {
            return
        }
        
        if date > endDate {
            return
        }
        calenderView.scrollToDate(date)
        updateYearLabel(date: date)
        currentDate = date
    }
    
    lazy var yearStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftButton, yearLabel, rightButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        return formatter
    }()
    
    lazy var startDate = formatter.date(from: "2019 01 01")!
    lazy var endDate = formatter.date(from: "2025 12 31")!

    override func viewDidLoad() {
        setupSubViews()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        updateCalenderLabel(date: Date())
        fetchDaysWithNotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchDaysWithNotes()
    }
}

private extension ScheduleViewController {
 
    func fetchDaysWithNotes() {
        // Fetch from firebase and set to var daysWithNotes
        daysWithNotes.removeAll()
        NoteAPI().fetchNoteList { (timestamps) in
            for timestamp in timestamps {
                if let timeInterval = TimeInterval(timestamp) {
                    let date = Date(timeIntervalSince1970: timeInterval)
                    self.daysWithNotes.append(date)
                    self.calenderView.reloadData()
                }
            }
        }
    }
    
    @objc func handleMainMenu() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupSubViews() {
        view.addSubview(calenderView)
        view.addSubview(mainMenuButton)
        view.addSubview(monthLabel)
        view.addSubview(daysStackView)
        view.addSubview(yearStackView)
        
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
        calenderView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        //Setup year
        yearStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        yearStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        yearStackView.topAnchor.constraint(equalTo: calenderView.bottomAnchor, constant: 20).isActive = true
        yearStackView.bottomAnchor.constraint(equalTo: mainMenuButton.bottomAnchor, constant: -50).isActive = true
        
        mainMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
    }
}

extension ScheduleViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func handleCellTextColor(cell: DayCell?, cellState: CellState) {
        if cellState.dateBelongsTo != .thisMonth {
            cell?.dateLabel.textColor = UIColor.lightGray.withAlphaComponent(0.5)
        } else {
            cell?.dateLabel.textColor = .black
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        // Check documentation
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        if let cell = calenderView.dequeueReusableJTAppleCell(withReuseIdentifier: "cell", for: indexPath) as? DayCell {
            handleCellTextColor(cell: cell, cellState: cellState)
            cell.setup()
            cell.dateLabel.text = cellState.text
            
            if daysWithNotes.contains(date) {
                cell.dateLabel.backgroundColor = .customBlue
            } else {
                cell.dateLabel.backgroundColor = .clear
            }
            return cell
        }
        return JTAppleCell()
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 6, calendar: Calendar.current, generateInDates: .forAllMonths, generateOutDates: .tillEndOfRow, firstDayOfWeek: .sunday, hasStrictBoundaries: true)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        guard let date = visibleDates.monthDates.last?.date else {
            return
        }
        updateCalenderLabel(date: date)
        updateYearLabel(date: date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let cell = cell as? DayCell else {
            return
        }
        
      // Open note viewer
        let vc = NoteListViewController()
        vc.date = date
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateCalenderLabel(date: Date) {
        currentDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        monthLabel.text = dateFormatter.string(from: date)
    }
    
    func updateYearLabel(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        yearLabel.text = dateFormatter.string(from: date)
    }
}
