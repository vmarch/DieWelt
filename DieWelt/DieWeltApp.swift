//
//  DieWeltApp.swift
//  DieWelt
//
//  Created by devtolife on 14.09.21.
//

import SwiftUI

@main
struct DieWeltApp: App {
    @StateObject var dc: DataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }.environmentObject(dc)
             .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
