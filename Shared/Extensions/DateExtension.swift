//
//  DateExtension.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/16.
//

import Foundation

extension Date {
    
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        return dateFormatter.string(from: self)
    }
}
