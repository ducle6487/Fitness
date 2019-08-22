//
//  ProgressController.swift
//  Fitness
//
//  Created by Duc'sMacBook on 8/19/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ProgressController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var monthLb: UILabel!
    @IBOutlet weak var yearLb: UILabel!
    let dateCurrent = Date()
    var isDone = true
    
    var dayInWeeks = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    
//    func initData(_ dates: [Date]) {
//
//        calendarView.selectDates(
//            from: dates.first!,
//            to: dates.last!,
//            triggerSelectionDelegate: true,
//            keepSelectionIfMultiSelectionAllowed: true)
//
//        calendarView.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendarView.scrollToDate(dateCurrent, animateScroll: false)
        print(dateCurrent)
        
        calendarView.minimumInteritemSpacing = 0
        calendarView.minimumLineSpacing = 0
        calendarView.scrollingMode = .stopAtEachCalendarFrame
        
    }
    
    @IBAction func previousAct(_ sender: Any) {
        self.calendarView.scrollToSegment(.previous)
    }
    
    @IBAction func nextAct(_ sender: Any) {
        self.calendarView.scrollToSegment(.next)
    }
    
    func setupMonthLabel(date:Date){
        let calendar = Calendar.current
        let anchorComponent = calendar.dateComponents([.day,.month,.year], from: date)
        let month = String(anchorComponent.month ?? 1)
        let year = String(anchorComponent.year ?? 2018)
        
        monthLb.text = month
        yearLb.text = year
    }
    
    func handleCellColor(cell: DayinMonthCollectionCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.dayLb.textColor = .black
        } else {
            cell.dayLb.textColor = .gray
        }
    }
    
    func handleCellCurrentDay(cell: DayinMonthCollectionCell, cellState: CellState){
        if Calendar.current.isDateInToday(cellState.date){
            cell.viewContainer.layer.cornerRadius = 17.0
            cell.viewContainer.backgroundColor = UIColor(red: 255/255, green: 141/255, blue: 0/255, alpha: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return CGSize(width: self.collectionView.frame.width / 7, height: self.collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayInWeeks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayofweek", for: indexPath) as? DayofWeekCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dayLb.text = dayInWeeks[indexPath.item]
        return cell
    }
    
}

extension ProgressController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource{
    // setting các yêu cầu của calendar và trả về 1 configurationParametter.
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDay = formatter.date(from: "2018 01 01")
        let endDay = formatter.date(from: "2030 12 31")
        let parameter = ConfigurationParameters(startDate: startDay!,
                                                endDate: endDay!,
                                                numberOfRows: 6,
                                                generateInDates: .forAllMonths,
                                                generateOutDates: .tillEndOfGrid,
                                                firstDayOfWeek: .monday)
        return parameter
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! DayinMonthCollectionCell
        // setting các chi tiết muốn hiện lên MH
        handleCellColor(cell: cell, cellState: cellState)
        handleCellCurrentDay(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dayinmonth", for: indexPath) as! DayinMonthCollectionCell
        cell.dayLb.text = cellState.text
        // apply những thay dổi ở func trên: (willDisplay)
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return cell
    }
    // màn hình nhảy tới tháng hiện tại
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupMonthLabel(date: visibleDates.monthDates.first!.date)
    }
    
}
