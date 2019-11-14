//
//  StylistCalendarViewController.swift
//  XTeam
//
//  Created by paly on 12/11/19.
//  Copyright © 2019 paly. All rights reserved.
//

import UIKit

class StylistCalendarViewController: UIViewController {
    
    // MARK :- Outlets
    @IBOutlet weak var dayDateLabel: UILabel!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK :- Instance Vars / Properties
    private var selectedDate = Date()
    private var selectedIndex = 0
    private var collectionViewDates: [Date] = []
    
    // MARK :- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInsetAdjustmentBehavior = .never
        setUpCategoryCollectionView()
        selectedDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
        getAllDates()
        handleTapGesturesOfLeftAndRightArrows()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK :- Methods Called by ViewController LifeCycle Method i.e viewDidLoad()
    private func setUpCategoryCollectionView() {
        let flow = calendarCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.scrollDirection = .horizontal
        let width = 74
        flow.itemSize = CGSize.init(width: width, height: 88)
        flow.minimumInteritemSpacing = CGFloat(8)
        flow.minimumLineSpacing =  CGFloat(8)
        calendarCollectionView.register(UINib.init(nibName: "CalendarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CalendarCollectionViewCell")
        calendarCollectionView.contentInset.left = 20
        calendarCollectionView.contentInset.right = 20
    }
    
    private func getAllDates() {
        calendarCollectionView.reloadData()
        collectionViewDates = getAllDates(month: selectedDate.month, year: selectedDate.year)
        self.modifyDayDateLabel()
        if let index = collectionViewDates.firstIndex(of: selectedDate) {
            calendarCollectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: .left, animated: true)
        }
    }
    
    private func handleTapGesturesOfLeftAndRightArrows() {
        leftView.addTapGestureRecognizer(action: {
            if let previousDate = self.getPrevious(date: self.selectedDate) {
                self.selectedDate = previousDate.startOfMonth()
                self.getAllDates()
                self.modifyDayDateLabel()
            }
        })
        
        rightView.addTapGestureRecognizer(action: {
            if let nextDate = self.getNext(date: self.selectedDate) {
                self.selectedDate = nextDate.startOfMonth()
                self.getAllDates()
                self.modifyDayDateLabel()
            }
        })
    }
    
    private func setUpTableView() {
        tableView.register(UINib.init(nibName: "StylistTableViewCell", bundle: nil), forCellReuseIdentifier: "StylistTableViewCell")
    }
}

// MARK:- Mangage the top Day, date label

extension StylistCalendarViewController {
    private func modifyDayDateLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE,"
        let dayStr = dateFormatter.string(from: selectedDate)
        let font = UIFont.init(name: "Gilroy-Bold", size: 28.0)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.init(hexString: "#222222"),
        ]
        let attributedString = NSAttributedString.init(string: dayStr, attributes: attributes)
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = " MMM dd"
        let dateString = dateFormatter1.string(from: selectedDate)
        
        let semi_font = UIFont.init(name: "Gilroy-Regular", size: 28.0)
        let dateAttribute: [NSAttributedString.Key: Any] = [
            .font: semi_font,
            .foregroundColor: UIColor.init(hexString: "#222222"),
        ]
        let attributedDateString = NSAttributedString.init(string: dateString, attributes: dateAttribute)
        
        let combination = NSMutableAttributedString()
        combination.append(attributedString)
        combination.append(attributedDateString)
        
        dayDateLabel.attributedText = combination
    }
}

// MARK:- Functions dealing with Date Manipulation
extension StylistCalendarViewController {
    
    func getNext(date: Date) -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: date)
    }
    
    func getPrevious(date: Date) -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: date)
    }
    
    func getAllDates(month: Int, year: Int) -> [Date] {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = TimeZone.current
        var arrDates = [Date]()
        for day in 1...numDays {
            let dateString = "\(year) \(month) \(day)"
            if let date = formatter.date(from: dateString) {
                arrDates.append(date)
            }
        }
        
        return arrDates
    }
}

// MARK:- UICollectionViewDelegate
extension StylistCalendarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = collectionViewDates[indexPath.item]
        modifyDayDateLabel()
        collectionView.reloadData()
    }
}

// MARK:- UICollectionViewDelegate
extension StylistCalendarViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewDates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as! CalendarCollectionViewCell
        cell.setSelection(state: collectionViewDates[indexPath.item] == selectedDate)
        cell.set(date: collectionViewDates[indexPath.item])
        return cell
    }
}

// MARK:- UITableViewDataSource
extension StylistCalendarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StylistTableViewCell", for: indexPath) as! StylistTableViewCell
        if indexPath.item == 0 {
            cell.setAsTopCell()
        }
        cell.selectionStyle = .none
        cell.customizeForStylistCalendarView()
        return cell
    }
}

// MARK:- UITableViewDelegate
extension StylistCalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (indexPath.row)
    }
}

