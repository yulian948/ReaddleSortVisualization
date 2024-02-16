//
//  AlgorithmsListViewModel.swift
//  SortVisualizationTestTask
//
//  Created by Yulian on 06.02.2024.
//

import Combine
import Foundation

struct AlgorithmListEntry: Identifiable {
    var id = UUID().uuidString
    
    let name: String
    let sortingAlgorithm: SortingAlgorithm
}

class AlgoListViewModel: ObservableObject {
    @Published var algorithms: [AlgorithmListEntry] = [
        AlgorithmListEntry(name: "Bubble Sort", sortingAlgorithm: BubbleSort()),
        AlgorithmListEntry(name: "Selection Sort", sortingAlgorithm: SelectionSort()),
        AlgorithmListEntry(name: "Insertion Sort", sortingAlgorithm: InsertionSort())
    ]
}

