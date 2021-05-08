//
//  MainView.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 26/04/2021.
//

import SwiftUI

struct MainView: View {
    let viewModel = MainViewViewModel()
    
    var body: some View {
        TabView {
            ConvertView().tabItem {
                Label(ConvertView.tabTitle,
                      systemImage: ConvertView.imageTitle)
            }
            HistoryView().tabItem {
                Label(HistoryView.tabTitle,
                      systemImage: HistoryView.imageTitle)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
