//
//  SortingAlgorithm.swift
//  ReaddleSortVisualization
//
//  Created by Yulian on 06.02.2024.
//

import Combine
import Foundation

protocol SortingAlgorithm {
    func sort(_ array: [Int], stepDelaySeconds: Double) -> AnyPublisher<[Int], Never>
}
