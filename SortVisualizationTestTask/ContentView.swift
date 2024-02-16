//
//  ContentView.swift
//  SortVisualizationTestTask
//
//  Created by Yulian on 06.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AlgorithmsListView(viewModel: AlgoListViewModel())
    }
}

#Preview {
    ContentView()
}
