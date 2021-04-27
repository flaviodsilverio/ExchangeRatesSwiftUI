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
            Button {

            } label: {
                Text("Title")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .font(Font.largeTitle)
                    .border(Color.blue)
            }
            .padding([.leading, .trailing], 16)
        }
    }
}

struct AddCurrency_Previews: PreviewProvider {
    static var previews: some View {
        AddCurrencyView()
    }
}
