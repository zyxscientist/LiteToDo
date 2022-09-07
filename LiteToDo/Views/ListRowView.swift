//
//  ListRowView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import SwiftUI


struct ListRowView: View {
    
    @State var title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "This is the first title")
    }
}
