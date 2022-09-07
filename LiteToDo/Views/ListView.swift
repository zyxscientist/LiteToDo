//
//  ListView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import SwiftUI

struct ListView: View {
    
    @State var items:[ItemModel] = [
       ItemModel(title: "Item 1", isCompleted: false),
       ItemModel(title: "Item 2", isCompleted: false),
       ItemModel(title: "Item 3", isCompleted: true)
    ]
    
    var body: some View {
        
        List{
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .navigationTitle("Todo List")
        
        // TOOLBAR
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    // TODO: PAGE FOR ADDING NEW LIST ITEMS
                    ItemAddView()
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                // TODO: LIST EDIT FUNCTION
                EditButton()
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // 因为main页面是没有预览的，所以在这里模拟一下
            ListView()
        }
    }
}

