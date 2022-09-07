//
//  ListRowView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import SwiftUI


struct ListRowView: View {
    
    @State var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.blue)
                .font(.system(.title2, design: .rounded))
            Text(item.title)
                .font(.system(.title2, design: .rounded))
            Spacer()
        }.padding(.vertical, 10)
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    // MARK: CLASSIC COMPONENT PREVIEW WITH FAKE DATA ❤️
    
    static var item1 = ItemModel(title: "Item 1", isCompleted: false)
    static var item2 = ItemModel(title: "Item 2", isCompleted: true)
    
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
