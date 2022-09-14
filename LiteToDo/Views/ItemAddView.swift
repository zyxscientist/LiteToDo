//
//  ItemAddView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/7.
//

import SwiftUI

struct ItemAddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    
    // Properties for alert
    @State var alertTitle: String = ""
    @State var showTextFieldAppropriateCheckAlert: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                TextField("What ya gonna do", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                Button {
                    if textFieldAppropriateCheck() {
                        listViewModel.addItem(add: textFieldText)
                        presentationMode.wrappedValue.dismiss()
                        print("New item has been saved")
                    }
                } label: {
                    Text("Save")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.semibold)
                        .padding()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                }
            }
        }
        .padding(.horizontal, 15)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Add")
        .alert(Text(alertTitle), isPresented: $showTextFieldAppropriateCheckAlert) {
            // leave it default
        }
    }
    
    func textFieldAppropriateCheck() -> Bool {
        if textFieldText != "" {
            return true
        } else {
            showTextFieldAppropriateCheckAlert.toggle()
            alertTitle = "The inputfield cannot be empty"
            return false
        }
    }
}

struct ItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemAddView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(ListViewModel())
        // MARK: 预览无法获得整个App级别的环境数据，所以这里要手动挂上
        .previewInterfaceOrientation(.portrait)
    }
}
