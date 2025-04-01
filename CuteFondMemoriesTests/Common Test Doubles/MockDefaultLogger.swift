//
//  MockDefaultLogger.swift
//  CuteFondMemoriesTests
//
//

import Foundation
@testable import CuteFondMemories

final class MockDefaultLogger: DefaultLoggerProtocol, MockTrackable {
    
    enum MethodName: Equatable, Hashable {
        case logInit
        case logDeinit
        case log
    }
    
    var calledMethods = Set<MethodName>()
    var methodCallCounts: [MethodName: Int] = [:]
    
    private(set) var className: String = ""
    private(set) var text: String = ""
}

extension MockDefaultLogger {
    func logInit(_ className: String) {
        self.className = className
        recordMethodCall(.logInit)
    }
    
    func logDeinit(_ className: String) {
        self.className = className
        recordMethodCall(.logDeinit)
    }
    
    func log(text: String) {
        recordMethodCall(.log)
        self.text = text
    }
}
