//
//  NoItemsView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/13.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animationToggle: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                Text("No Item")
                    .fontWeight(.bold)
                    .font(.system(size: 36, design: .rounded))
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.")
                    .foregroundColor(.gray)
                    .font(.system(size: 20, design: .rounded))
                
                NavigationLink {
                    ItemAddView()
                } label: {
                    Text("Add 🥵")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .frame(width: 180)
                        .padding(.vertical)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                }
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 25)
            .padding(.top, 100)
            // TODO: 进场动画
//            .onAppear(perform: )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
//        func
    }
    
    struct NoItemsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                NoItemsView()
                    .navigationTitle("Title for preview")
            }
        }
    }
}
