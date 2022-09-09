//
//  ListViewModel.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import Foundation

/*
 CRUD FUNCTIONS - 对于数据最最常见的四种操作
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items:[ItemModel] = [] {
        didSet { // 观察者属性，每次对 items 实例进行修改时都调用一次储存
            saveItem()
        }
    }
    
    var listItemKey: String = "listItemKey"
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: listItemKey),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data) else {
                return
            }
        
        self.items = decodedData
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
        items[index] = item.upadteCompletion() // 数组中的这位[index]的内容更新为 item.upadteCompletion()
        // 而这样是传进来的值原地更新，id还是那个id，string还是那个string，但是完成状态反过来一下
        }
    }
    
    func saveItem(){
        // 思路是先将数据转码成JSON，再使用UserDefault存起来
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: listItemKey)
            print("item saved")
        }
    }
}
