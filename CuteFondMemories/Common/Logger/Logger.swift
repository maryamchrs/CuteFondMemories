//
//  Logger.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

class Logger {
    
    private static let separator = " ---> "
    
    class func logInit(owner: String) {
        let string = "LifeCycle" + separator + owner + " init"
        debugPrint(string)
    }
    
    class func logDeinit(prefix: String? = nil, owner: String) {
        let string = "LifeCycle" + separator + owner + " deinit"
        debugPrint(string)
    }
    
    class func log(prefix: String? = nil, text: String) {
        debugPrint(text)
    }
}
