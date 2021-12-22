//
//  PublicFunctions.swift
//  CGA
//
//  Created by Abdul Kareem on 12/15/21.
//
//
import Foundation


public func print(items: Any..., separator: String = "", terminator: String = "\n") {
    
    let output = items.map{"*\($0)"}.joined(separator: separator)
    Swift.print(output, separator: separator, terminator: terminator)
}

public func print(error: Error, functionName: String) {
    
    Swift.print("######\n\(Bundle.main.appName ?? "CGA")Error: \(error)", separator: ":", terminator: "\nFunctionName: \(functionName)\n#####")
}

extension Bundle {
    var appName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
