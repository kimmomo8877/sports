//
//  DateUtils.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/23.
//

import Foundation

class DateUtils {
    static func convertStringToDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "Asia/Seoul") as TimeZone?
        return dateFormatter.date(from: dateString)!
    }
}
