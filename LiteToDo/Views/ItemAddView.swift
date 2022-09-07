//
//  ItemAddView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import SwiftUI

struct ItemAddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            
            // FIXME: SOME SAFEAREA ISSUE IN PORTRAIT MODE
            VStack {
                TextField("What ya gonna do", text: $textFieldText)
                    .padding()
                    .frame(width:UIScreen.main.bounds.size.width - 30, height: 55)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                Button {
                    //
                } label: {
                    Text("Save")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.semibold)
                        .padding()
                        .frame(width:UIScreen.main.bounds.size.width - 30, height: 55)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                }
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Add")
    }
}

struct ItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemAddView()
        }
        .previewInterfaceOrientation(.portrait)
    }
}
