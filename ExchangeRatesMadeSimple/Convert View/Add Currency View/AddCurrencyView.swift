//
//  AddCurrencyView.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 27/04/2021.
//

import SwiftUI

struct AddCurrencyView: View {
    var body: some View {
        HStack {
            Spacer().frame(width: 16)
            
            Button("+") {

            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .font(Font.largeTitle)
            .border(Color.blue)

            Spacer().frame(width: 16)
        }
    }
}

struct AddCurrency_Previews: PreviewProvider {
    static var previews: some View {
        AddCurrencyView()
    }
}
