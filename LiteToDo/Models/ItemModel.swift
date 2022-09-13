//
//  ItemModel.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool

    
    // 更新已有数据的功能需要在数据模型里面提供
    func upadteCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

