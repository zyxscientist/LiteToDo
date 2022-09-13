//
//  NoItemsView.swift
//  LiteToDo
//
//  Created by 朱宇軒 on 2022/9/13.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var placeholderAnimationToggle: Bool = false
    @State var buttonAnimationToggle: Bool = false
    
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
                        .background(buttonAnimationToggle ? Color.blue : Color.red)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                        .offset(y: buttonAnimationToggle ? -7 : 0)
                }
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 25)
            .padding(.top, placeholderAnimationToggle ? 100 : 130)
            .onAppear(perform: viewAnimate)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(placeholderAnimationToggle ? 1 : 0)
        }
        
    }
    
    func viewAnimate(){
        guard !placeholderAnimationToggle, !buttonAnimationToggle else {return}
        // 保证 animationToggle 为假，如果为真直接打断
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            // 整体进场动画
            withAnimation(.easeInOut) {
                placeholderAnimationToggle.toggle()
            }
            
            // 按钮变色动画
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                buttonAnimationToggle.toggle()
            }
        }
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
