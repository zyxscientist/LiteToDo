//
//  ListView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        // List View
        List{
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItemCompletion(item: item)
                        }
                    }
            }
            .onDelete { indexSet in
                listViewModel.deleteItem(index: indexSet)
            }
            .onMove { fromIndex, toIndex in
                listViewModel.moveItem(fromIndex: fromIndex, toIndex: toIndex)
            }
        }
        .navigationTitle("Todo List")
        
        // TOOLBAR
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    ItemAddView()
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                // TODO: LIST EDIT FUNCTION
                EditButton() // 高度集成
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // 因为main页面是没有预览的，所以在这里模拟一下
            ListView()
        }.environmentObject(ListViewModel())
        // MARK: 预览无法获得整个App级别的环境数据，所以这里要手动挂上
    }
}

