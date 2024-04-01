//
//  MainView.swift
//  Expenses_App
//
//  Created by Mikhail Demichev on 01.04.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.yellow)
                    .opacity(0.6)
                    .ignoresSafeArea(.all)
                    
                VStack {
                    Text("MY EXPESNES APP")
                        .bold()
                        .font(.title)
                    
                    Image("wallet")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .offset(y:-10)
                }
            } .frame(height: 240)
          
            Spacer().frame(height: 10)
            
            AllExpensesView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
