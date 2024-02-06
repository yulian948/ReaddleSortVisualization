//
//  AlgorithmVisualizationView.swift
//  ReaddleSortVisualization
//
//  Created by Yulian on 06.02.2024.
//

import SwiftUI

struct AlgorithmVisualizationView: View {
    @ObservedObject var viewModel: AlgorithmVisualizationViewModel
    
    var body: some View {
            VStack {
                TextField("Enter numbers separated by commas", text: Binding<String>(
                    get: { self.viewModel.inputArray.map { String($0) }.joined(separator: ", ") },
                    set: {
                        self.viewModel.inputArray = $0.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
                    }
                ))
                .padding()
                
                Button(action: {
                    self.viewModel.sortArray()
                }) {
                    Text("Sort")
                }
                
                Text("Sorted Array: \(viewModel.sortedArray.map { String($0) }.joined(separator: ", "))")
                    .padding()
            }
            .padding()
        }
}

//#Preview {
//    AlgorithmVisualizationView()
//}
