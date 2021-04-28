//
//  AddCurrencyView.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 28/04/2021.
//

import SwiftUI

struct AddCurrencyView: View {
    @Binding var showingModally: Bool

    init(showingModally modally: Binding<Bool> = .constant(true)) {
        _showingModally = modally
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(ConfigFactory.makeConfigs()) { config in
                    ConversionItem(with: config)
                }
            }
                .navigationBarTitle("Currencies")
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                        Button("Add") {
                            showingModally.toggle()
                        }
                    }
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                        Button("Close") {
                            showingModally.toggle()
                        }
                    }
                }
        }
    }
}

struct AddCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        AddCurrencyView()
    }
}
