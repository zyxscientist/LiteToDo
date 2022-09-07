//
//  ListViewModel.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items:[ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "Item 1", isCompleted: false),
            ItemModel(title: "Item 2", isCompleted: false),
            ItemModel(title: "Item 3", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(index: IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItem(fromIndex: IndexSet,toIndex: Int){
        items.move(fromOffsets: fromIndex, toOffset: toIndex)
    }
    
    func addItem(add title: String){
        let newItems = [ItemModel(title: title, isCompleted: false)]
        items.insert(contentsOf: newItems, at: 0)
    }
    
}
