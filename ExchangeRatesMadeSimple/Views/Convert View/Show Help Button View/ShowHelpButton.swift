//
//  ShowHelpButton.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 30/04/2021.
//

import SwiftUI

struct ShowHelpButton: View {
    @State private var isPresentingHelp = false
    
    var body: some View {
        Button("Help") {
            isPresentingHelp.toggle()
        }.sheet(isPresented: $isPresentingHelp) {
            HelpPageView()
        }
    }
}

struct ShowHelpButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowHelpButton()
    }
}
