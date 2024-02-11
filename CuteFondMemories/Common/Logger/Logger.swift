//
//  Logger.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

class Logger {
    
    class var prefix: String {
        return "Unknown Prefixs"
    }
    
    class func logInit(owner: String) {
        let string = "LifeCycle" + " ---> " + owner + " init"
        debugPrint(string)
    }
    
    class func logDeinit(prefix: String? = nil, owner: String) {
        let string = "LifeCycle" + " ---> " + owner + " deinit"
        debugPrint(string)
    }
    
    class func log(text: String) {
        debugPrint(prefix, text)
    }
}
