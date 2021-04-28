//
//  AddCurrencyButtonView.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 27/04/2021.
//

import SwiftUI

struct AddCurrencyButtonView: View {
    @State private var showingSheet = false

    var body: some View {
        HStack {
//            Button {
//
//            } label: {
//                Text("Title")
//                    .frame(maxWidth: .infinity, maxHeight: 50)
//                    .font(Font.largeTitle)
//                    .border(Color.blue)
//            }
//            .padding([.leading, .trailing], 16)

            Button("+") {
                showingSheet.toggle()
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .font(Font.largeTitle)
            .border(Color.blue)
            .padding([.leading, .trailing], 16)
            .sheet(isPresented: $showingSheet) {
                AddCurrencyView(showingModally: $showingSheet)
             }

        }
    }
}

struct AddCurrencyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddCurrencyButtonView()
    }
}
