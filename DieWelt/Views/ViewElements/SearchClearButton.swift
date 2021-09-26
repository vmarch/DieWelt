//
//  SearchClearButton.swift
//  DieWelt
//
//  Created by devtolife on 26.09.21.
//

import SwiftUI
struct SearchClearButton: ViewModifier {
    @EnvironmentObject var dc:DataController
    @State var myPadding: EdgeInsets
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .topTrailing) { content
            
            if !dc.searchText.isEmpty {
                Button(action: {
                    dc.searchText = ""
                })
                {
                    Image(systemName: "multiply.circle.fill").foregroundColor(Color(.gray))
                }
                .padding(self.myPadding)
            }
        }
    }
}
