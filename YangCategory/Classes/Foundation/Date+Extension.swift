//
//  Date+Extension.swift
//  Pods-YangCategory_Example
//
//  Created by yanghuang on 2018/3/21.
//

import Foundation

// MARK: - 年/月/日/天
public extension Date {
    var re_day: Int {
        return Calendar.current.dateComponents([.day], from: self).day!
    }
    var re_week: Int {
        return Calendar.current.dateComponents([.weekday], from: self).weekday!
    }
    var re_month: Int {
        return Calendar.current.dateComponents([.month], from: self).month!
    }
    var re_year: Int {
        return Calendar.current.dateComponents([.year], from: self).year!
    }
    var re_hour: Int {
        return Calendar.current.dateComponents([.hour], from: self).hour!
    }
    var re_minute: Int {
        return Calendar.current.dateComponents([.minute], from: self).minute!
    }
    var re_second: Int {
        return Calendar.current.dateComponents([.second], from: self).second!
    }
    var re_dateComponent: DateComponents {
        return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
    }
    
    
}
// MARK: - Hour
public extension Date {
    
    var re_latestWholeHour: Date {
        let timeInterval = self.timeIntervalSince1970
        var tmp = timeInterval
        
        tmp = timeInterval - (timeInterval.truncatingRemainder(dividingBy: 60*60))
        if tmp == timeInterval {
        }
        tmp = tmp + 60 * 60
        return Date(timeIntervalSince1970: tmp)
    }
    func re_next(hours: Int) -> Date {
        var component = DateComponents()
        component.hour = hours
        return Calendar.current.date(byAdding: component, to: self)!
    }
}
// MARK: - Day
public extension Date {
    
    func re_days(to date: Date) -> Int {
        return Calendar.current.dateComponents(Set<Calendar.Component>([.day]), from: self, to: date).day ?? 0
    }
    var re_startOfToday: Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
    var re_endOfToday: Date {
        return Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self)!
    }
}

// MARK: - month
public extension Date {
    
    var re_startMomentOfCurrentMonth: Date {
        return re_firstDayOfCurrentMonth
    }
    var re_endMomentOfCurrentMonth: Date {
        return re_endDayOfCurrentMonth.re_endOfToday
    }
    
    var re_firstDayOfCurrentMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            Set<Calendar.Component>([.year, .month]), from: self)
        return calendar.date(from: components)!
    }
    var re_endDayOfCurrentMonth: Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.month = 1
        components.day = -1
        return calendar.date(byAdding: components, to: self.re_firstDayOfCurrentMonth)!
    }
    
}

public extension Date {
    var re_isInToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    func re_isInSameday(as: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: `as`)
    }
    var re_currentDay: Date {
        return re_startOfToday
    }
    var re_preMonth: Date {
        var components = DateComponents()
        components.month = -1
        return Calendar.current.date(byAdding: components, to: self.re_startMomentOfCurrentMonth)!
    }
    var re_nextMonth: Date {
        var components = DateComponents()
        components.month = 1
        return Calendar.current.date(byAdding: components, to: self.re_startMomentOfCurrentMonth)!
    }
    var re_nextDay: Date {
        var components = DateComponents()
        components.day = 1
        return Calendar.current.date(byAdding: components, to: self.re_currentDay)!
    }
    var re_preDay: Date {
        return self
    }
}

