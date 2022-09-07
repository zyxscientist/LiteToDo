//
//  ListView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import SwiftUI

struct ListView: View {
    
    @State var items:[String] = [
        "This is the first item",
        "This is the second item",
        "This is the third item"
    ]
    
    var body: some View {
        
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
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

