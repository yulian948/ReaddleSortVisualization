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
    @Published var stepArrays: [[Int]] = []
    @Published var currentOutputArray: [Int] = []
    
    @Published var isSorting: Bool = false
    
    @Published var currentStepIndex: Int = 0
    
    var isTextFieldEmpty: Bool {
        return inputArray.isEmpty
    }
    
    init(sortingAlgorithm: SortingAlgorithm) {
        self.sortingAlgorithm = sortingAlgorithm
    }
    
    func sortArray() {
        self.currentStepIndex = 0
        self.stepArrays.removeAll()
        self.stepArrays.append(self.inputArray)
        
        self.isSorting = true
        
        sortingAlgorithm.sort(inputArray, stepDelaySeconds: 0.5)
            .receive(on: DispatchQueue.main)
//            .delay(for: .seconds(1) , scheduler: RunLoop.main)
            .sink(receiveCompletion: { _ in
                self.isSorting = false
            }, receiveValue: { [weak self] sortedArray in
                self?.stepArrays.append(sortedArray)
                self?.currentOutputArray = sortedArray
                self?.currentStepIndex += 1
            })
            .store(in: &cancellables)
    }
    
    func stepForward() {
        guard currentStepIndex < stepArrays.count - 1 else { return }
        currentStepIndex += 1
        
        if stepArrays.count > currentStepIndex {
            currentOutputArray = stepArrays[currentStepIndex]
        }
    }
    
    func stepBackward() {
        guard currentStepIndex > 0 else { return }
        
        currentStepIndex -= 1
        
        if stepArrays.count > currentStepIndex {
            currentOutputArray = stepArrays[currentStepIndex]
        }
    }
}
