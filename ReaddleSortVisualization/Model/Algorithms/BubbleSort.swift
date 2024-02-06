//
//  BubbleSort.swift
//  ReaddleSortVisualization
//
//  Created by Yulian on 06.02.2024.
//

import Combine
import Foundation

class BubbleSort: SortingAlgorithm {
    
    func sort(_ array: [Int], stepDelaySeconds: Double) -> AnyPublisher<[Int], Never> {
        let subject = PassthroughSubject<[Int], Never>()
        
        DispatchQueue.global().async {
            var array = array
            let n = array.count
            var swapped = false
            
            for i in 0..<n {
                swapped = false
                for j in 0..<n-i-1 {
                    if array[j] > array[j+1] {
                        array.swapAt(j, j+1)
                        swapped = true
                        
                        print(array)
                        subject.send(Array(array))
                        Thread.sleep(forTimeInterval: stepDelaySeconds) // TODO: Handle speed in View Model rather then here.
                    }
                }
                
                if !swapped {
                    break
                }
            }
            
            subject.send(completion: .finished)
        }
        
        return subject.eraseToAnyPublisher()
    }
}
