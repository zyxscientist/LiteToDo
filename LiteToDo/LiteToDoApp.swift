//
//  LiteToDoApp.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/6.
//

import SwiftUI

/*
 using MVVM Architecture in this project
 
 Model
    数据模型
 View
    基础UI及简单的UI逻辑
 ViewModel
    链接视图与UI的桥梁
 */

@main
struct LiteToDoApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(listViewModel)
            // 将数据在首页创建的时候就挂在环境中
        }
    }
}

