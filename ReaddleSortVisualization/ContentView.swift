//
//  ContentView.swift
//  ReaddleSortVisualization
//
//  Created by Yulian on 06.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AlgorithmVisualizationView(viewModel: AlgorithmVisualizationViewModel(sortingAlgorithm: BubbleSort()))
    }
}

#Preview {
    ContentView()
}
