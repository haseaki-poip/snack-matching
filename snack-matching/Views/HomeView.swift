//
//  ContentView.swift
//  snack-matching
//
//  Created by Hasegawa Akito on 2023/02/03.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("appColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text("いとお菓子")
                        .foregroundColor(Color.brown)
                        .font(Font.system(size: 45).bold())
                        .padding(.bottom, 0.1)
                    
                    Text("お菓子なマッチングアプリ")
                        .foregroundColor(Color.brown)
                        .font(Font.system(size: 15))
                    
                    VStack {
                        HStack {
                            Image("chips")
                                .resizable()
                                .frame(width: 150, height: 150)
                            Image("chocolate")
                                .resizable()
                                .frame(width: 150, height: 150)
                        }
                
                        Image("cookie")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    .padding()
                    
                    VStack {
                        HomeNavigationButton {
                            Text("swipe")
                                       
                                            }
                        
                        HomeNavigationButton {
                            Text("swipe")
                                       
                                            }
                        .frame(height: 80)
                    }
                }
            }
        }
        
    }
}

struct HomeNavigationButton<Content: View>: View {
    
    let content: Content
    

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
        
    
    var body: some View {
        NavigationLink(destination: {
            content
                                       }, label: {
                                           Text("")
                                               .frame(width: 150)
                                               .padding()
                                               .background(Color.brown)
                                               .foregroundColor(Color.white)
                                               .cornerRadius(10)
                                               
                                       })
        .frame(height: 80)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
