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
    
    func updateItemCompletion(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) { // 找到id为这个项，并且把它的序号index给我
            
        // items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
        // 上面这样写的意思是完全重新创建一个新的 ItemModel 这是不科学的
        
        items[index] = item.upadteCompletion() // 数组中的这位[index]的内容更新为 item.upadteCompletion()
        // 而这样是传进来的值原地更新，id还是那个id，string还是那个string，但是完成状态反过来一下
        
        }
    }
}
