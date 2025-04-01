//
//  DummyDefaultLogger.swift
//  CuteFondMemoriesTests
//
//  Created by Maryam Chrs on 01/04/2025.
//

import Foundation
@testable import CuteFondMemories

final class DummyDefaultLogger: DefaultLoggerProtocol {
    func log(text: String) {}
    
    func logInit(_ className: String) {}
    
    func logDeinit(_ className: String) {}
}
