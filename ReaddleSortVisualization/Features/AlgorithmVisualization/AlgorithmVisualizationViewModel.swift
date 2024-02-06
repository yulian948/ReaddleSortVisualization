//
//  AlgorithmVisualizationViewModel.swift
//  ReaddleSortVisualization
//
//  Created by Yulian on 06.02.2024.
//

import Combine
import Foundation

class AlgorithmVisualizationViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    private let sortingAlgorithm: SortingAlgorithm
    
    @Published var inputArray: [Int] = []
    @Published var sortedArray: [Int] = []
    
    init(sortingAlgorithm: SortingAlgorithm) {
        self.sortingAlgorithm = sortingAlgorithm
    }
    
    func sortArray() {
        sortingAlgorithm.sort(inputArray)
            .receive(on: DispatchQueue.main)
//            .delay(for: .seconds(1) , scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] sortedArray in
                print("STEP: \(sortedArray)")
                self?.sortedArray = sortedArray
            })
            .store(in: &cancellables)
    }
}
