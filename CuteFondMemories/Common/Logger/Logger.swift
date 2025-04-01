//
//  Logger.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 09/02/2024.
//

import Foundation

protocol DefaultLoggerProtocol {
    func log(text: String)
    func logInit(_ className: String)
    func logDeinit(_ className: String)
}

struct Logger: DefaultLoggerProtocol {
    
    private var needToShowLogs: Bool
    private var logClosure: ((String) -> Void)?
    
    init(needToShowLogs: Bool = true,
         logClosure: ((String) -> Void)? = nil) {
        self.needToShowLogs = needToShowLogs
        self.logClosure = logClosure ?? { debugPrint($0) }
    }
    
    func logInit(_ className: String) {
        logClosure?("LIFECYCLE: ----> [\(className)] Initialized")
    }
    
    func logDeinit(_ className: String) {
        logClosure?("LIFECYCLE: ----> [\(className)] Deinitialized")
    }

    func log(text: String) {
        guard needToShowLogs else { return }
        logClosure?(text)
    }
}
