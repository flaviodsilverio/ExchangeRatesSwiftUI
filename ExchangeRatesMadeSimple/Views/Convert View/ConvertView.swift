//
//  ConvertView.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 22/04/2021.
//

import SwiftUI

struct ConfigFactory {
    static func makeConfigs() -> [ConversionItemConfiguration] {
        return [
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
    }
}

struct ConvertView: View {
    var body: some View {
        NavigationView {

            VStack {
                Spacer().frame(width: 0.0, height: 20)

                HStack {
                    ConversionItem(with: ConversionItemConfiguration(isEditable: true))
                        .padding([.trailing, .leading], 16.0)
                }

                AddCurrencyButtonView()

                List {
                    ForEach(ConfigFactory.makeConfigs()) { config in
                        ConversionItem(with: config)
                    }
                    .onMove() {
                        x, y in
                    }
                    .onDelete() {
                        element in
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationBarTitle("Exchange rates", displayMode: .inline)
            //            .navigationBarHidden(true)
            .toolbar {

                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    ShowHelpButton()
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    EditButton()
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
