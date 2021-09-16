//
//  Extensions.swift
//  DieWelt
//
//  Created by devtolife on 14.09.21.
//

import SwiftUI
extension Binding {
    func didSet(execute: @escaping (Value) -> Void) -> Binding {
        return Binding(
            get: {
                return self.wrappedValue
            },
            set: {
                self.wrappedValue = $0
                execute($0)
            }
        )
    }
}

extension Date {
    func getDateAsString(string: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MM yyyy HH:mm:ss ZZZ"
 
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "dd.MM.yyyy"
        
        let str = dateFormatter2.string(from: dateFormatter.date(from: string)!)
        return str
    }
    
    
    var getDateAsString: String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm"
        
        let currentDateStr = dateFormatter.string(from: self)
        return currentDateStr
        
    }
    
}
