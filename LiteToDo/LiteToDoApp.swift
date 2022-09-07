//
//  LiteToDoApp.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/6.
//

import SwiftUI

/*
 using MVVM Architecture in this project
 
 Model - data point
 View - UI
 ViewModel - manages Models for view
 */

@main
struct LiteToDoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
        }
    }
}
