//
//  DateExtension.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 23/02/2024.
//

import Foundation

extension Date {
    
    var withoutTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        return dateFormatter.string(from: self)
    }
    
}
