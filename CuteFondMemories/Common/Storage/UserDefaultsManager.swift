//
//  UserDefaultsManager.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

enum UserDefaultCase: String {
    case isTheFirstTime = "is_the_first_time_that_user_open_app"
    case lastLocation = "last_location"
}

protocol UserDefaultsManagerProtocol {
    func saveIsTheFirstTimeStatus(_ isFirstTime: Bool)
    func getIsTheFirstTimeStatus() -> Bool
}

final class UserDefaultsManager: UserDefaultsManagerProtocol{
    func saveIsTheFirstTimeStatus(_ isFirstTime: Bool) {
        UserDefaults.standard.setValue(isFirstTime,
                                       forKey: UserDefaultCase.isTheFirstTime.rawValue)
    }
    
    func getIsTheFirstTimeStatus() -> Bool {
        UserDefaults.standard.bool(forKey: UserDefaultCase.isTheFirstTime.rawValue)
    }
}
