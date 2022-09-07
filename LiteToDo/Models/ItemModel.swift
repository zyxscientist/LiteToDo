//
//  ItemModel.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import Foundation

struct ItemModel: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
}

