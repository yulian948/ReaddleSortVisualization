//
//  AlgorithmsListView.swift
//  ReaddleSortVisualization
//
//  Created by Yulian on 06.02.2024.
//

import SwiftUI

struct AlgorithmsListView: View {
    @ObservedObject var viewModel: AlgoListViewModel
    
    @State private var selectedAlgorithm: AlgorithmListEntry?
    
    var body: some View {
        NavigationView {
            List(viewModel.algorithms, id: \.name) { algorithm in
                Button(action: {
                    selectedAlgorithm = algorithm
                }) {
                    Text(algorithm.name)
                }
            }
            .navigationTitle("Sorting Algorithms")
            .sheet(item: $selectedAlgorithm) { algorithm in
                AlgorithmVisualizationView(viewModel: AlgorithmVisualizationViewModel(sortingAlgorithm: algorithm.sortingAlgorithm))
            }
        }
    }
}
