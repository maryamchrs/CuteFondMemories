//
//  StringExtension.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 29/02/2024.
//

import Foundation

extension String {
    
    var localize: String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
    
    func localizedWithArgs(_ args: [CVarArg]) -> String {
        return String(format: self.localize, arguments: args)
    }
    
    func localizedWithLang(_ lang: String) -> String {
        return NSLocalizedString(self, tableName: lang, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localizedWithLangAndArgs(_ lang: String, _ args: [CVarArg]) -> String {
        return String.init(format: self.localizedWithLang(lang), args)
    }
    
}
