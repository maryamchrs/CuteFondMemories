//
//  Logger.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 09/02/2024.
//

import Foundation

protocol DefaultLoggerProtocol {
    func log(text: String)
}

protocol Loggable: AnyObject {
    var logger: DefaultLoggerProtocol { get }
}

extension Loggable {
    // Uses automatic reference to self as unowned to prevent retain cycles
    private var className: String {
        String(describing: type(of: self))
    }
    
    func logInit() {
        // Using unowned here is safe because this will only be called during initialization
        logger.log(text: "LIFECYCLE: ----> [\(className)] Initialized")
    }
    
    func logDeinit() {
        // Using unowned here is safe because this will only be called during deinitialization
        logger.log(text: "LIFECYCLE: ----> [\(className)] Deinitialized")
    }
    
    func log(_ text: String) {
        logger.log(text: "----> [\(className)] \(text)")
    }
}

struct Logger: DefaultLoggerProtocol {
    private var needToShowLogs: Bool
    private var logClosure: ((String) -> Void)?
    
    init(needToShowLogs: Bool = true,
         logClosure: ((String) -> Void)? = nil) {
        self.needToShowLogs = needToShowLogs
        self.logClosure = logClosure ?? { debugPrint($0) }
    }
    
    func log(text: String) {
        guard needToShowLogs else { return }
        logClosure?(text)
    }
}
