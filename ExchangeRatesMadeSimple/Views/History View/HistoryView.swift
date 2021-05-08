//
//  HistoryView.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 26/04/2021.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        Text("This will be a graph")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

extension HistoryView: Tabbable {
    static var tabTitle: String = "History"
    static var imageTitle: String = "calendar"
}
