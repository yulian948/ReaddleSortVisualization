//
//  InsertionSort.swift
//  SortVisualizationTestTask
//
//  Created by Yulian on 06.02.2024.
//

import Combine
import Foundation

class InsertionSort: SortingAlgorithm {
    
    func sort(_ array: [Int], stepDelaySeconds: Double) -> AnyPublisher<[Int], Never> {
        let subject = PassthroughSubject<[Int], Never>()
        
        DispatchQueue.global().async {
            var array = array
            let n = array.count
            
            for i in 1..<n {
                let key = array[i]
                var j = i - 1
                
                while j >= 0 && array[j] > key {
                    array[j + 1] = array[j]
                    j -= 1
                }
                array[j + 1] = key
                
                subject.send(Array(array))
                Thread.sleep(forTimeInterval: stepDelaySeconds)
            }
            
            subject.send(completion: .finished)
        }
        
        return subject.eraseToAnyPublisher()
    }
}
