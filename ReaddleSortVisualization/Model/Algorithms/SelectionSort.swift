//
//  SelectionSort.swift
//  ReaddleSortVisualization
//
//  Created by Yulian on 06.02.2024.
//

import Combine
import Foundation

class SelectionSort: SortingAlgorithm {
    
    func sort(_ array: [Int], stepDelaySeconds: Double) -> AnyPublisher<[Int], Never> {
        let subject = PassthroughSubject<[Int], Never>()
        
        DispatchQueue.global().async {
            var array = array
            let n = array.count
            
            for i in 0..<n {
                var minIndex = i
                
                for j in (i + 1)..<n {
                    if array[j] < array[minIndex] {
                        minIndex = j
                    }
                }
                
                if minIndex != i {
                    array.swapAt(i, minIndex)
                    subject.send(Array(array))
                    Thread.sleep(forTimeInterval: stepDelaySeconds)
                }
            }
            
            subject.send(completion: .finished)
        }
        
        return subject.eraseToAnyPublisher()
    }
}
