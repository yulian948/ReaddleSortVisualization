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
    
    @Published var isSorting: Bool = false
    
    var isTextFieldEmpty: Bool {
        return inputArray.isEmpty
    }
    
    init(sortingAlgorithm: SortingAlgorithm) {
        self.sortingAlgorithm = sortingAlgorithm
    }
    
    func sortArray() {
        self.isSorting = true
        
        sortingAlgorithm.sort(inputArray, stepDelaySeconds: 0.5)
            .receive(on: DispatchQueue.main)
//            .delay(for: .seconds(1) , scheduler: RunLoop.main)
            .sink(receiveCompletion: { _ in
                self.isSorting = false
            }, receiveValue: { [weak self] sortedArray in
                self?.sortedArray = sortedArray
            })
            .store(in: &cancellables)
    }
}
