//
//  HelpPageView.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 30/04/2021.
//

import SwiftUI

struct HelpPageView: View {
    var body: some View {
        TabView {
            LastHelpPage()
            Text("test 3")
            Text("test 2")
            Text("test")
            LastHelpPage()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct HelpPageView_Previews: PreviewProvider {
    static var previews: some View {
        HelpPageView()
    }
}

struct LastHelpPage: View {
    var body: some View {
        ZStack {
            Image(systemName: "photo").resizable().frame(width: .infinity, height: .infinity)
            VStack {
                Spacer()
                Button("button") {

                }
                .foregroundColor(.white)
                .padding([.leading, .trailing, .bottom], 50)
                .background(Color.blue)
                .frame(width: 500, height: 50, alignment: .bottom)


            }

        }
    }

}
