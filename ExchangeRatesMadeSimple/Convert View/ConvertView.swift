//
//  ConvertView.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 22/04/2021.
//

import SwiftUI

struct ConvertView: View {
    let configs = [
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false),
        ConversionItemConfiguration(isEditable: false)
    ]

    var body: some View {
        VStack {
            Spacer().frame(width: 0.0, height: 20)

            HStack {
                Spacer().frame(width: 16.0)
                ConversionItem(with: ConversionItemConfiguration(isEditable: true))
                Spacer().frame(width: 16.0)
            }

            List {
                ForEach(configs) { config in
                    ConversionItem(with: config)
                }
            }
        }

    }
}


struct ConvertView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView()
    }
}

extension ConvertView: Tabbable {
    static var tabTitle: String = "Convert"
    static var imageTitle: String = "list.dash"
}
