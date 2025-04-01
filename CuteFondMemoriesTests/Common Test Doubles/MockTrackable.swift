//
//  MockTrackable.swift
//  CuteFondMemoriesTests
//

import Foundation

struct MethodCallInfo {
    let wasCalled: Bool
    let callCount: Int
}

protocol MockTrackable: AnyObject {
    associatedtype Method: Hashable
    
    var calledMethods: Set<Method> { get set }
    var methodCallCounts: [Method: Int] { get set }
    
    func cleanUp()
    func wasMethodCalled(_ type: Method) -> MethodCallInfo
    func recordMethodCall(_ type: Method)
}

extension MockTrackable {
    func cleanUp() {
        calledMethods.removeAll()
        methodCallCounts.removeAll()
    }
    
    func wasMethodCalled(_ type: Method) -> MethodCallInfo {
        return MethodCallInfo(
            wasCalled: calledMethods.contains(type),
            callCount: methodCallCounts[type] ?? 0
        )
    }
    
    func recordMethodCall(_ type: Method) {
        calledMethods.insert(type)
        methodCallCounts[type, default: 0] += 1
    }
}
