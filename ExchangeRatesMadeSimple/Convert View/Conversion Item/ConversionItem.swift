//
//  ConversionItem.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 26/04/2021.
//

import SwiftUI

struct ConversionItemConfiguration: Identifiable {
    var id = UUID()

    let isEditable: Bool
}

struct ConversionItem: View {
    let configuration: ConversionItemConfiguration
    @State private var text = "editable"

    init(with configuration: ConversionItemConfiguration = ConversionItemConfiguration(isEditable: false)) {
        self.configuration = configuration
    }

    var body: some View {
        HStack {
            Image(systemName: "photo").resizable().frame(width: 50, height: 50)
            VStack {
                Text("Something")
                Text("Something")
            }
            Spacer()
            configuration.isEditable ?
                AnyView(TextField("", text: $text)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .minimumScaleFactor(0.1)
                )
                :
                AnyView(Text("Static"))
        }
    }
}

struct ConversionItem_Previews: PreviewProvider {
    static var previews: some View {
        ConversionItem()
    }
}
