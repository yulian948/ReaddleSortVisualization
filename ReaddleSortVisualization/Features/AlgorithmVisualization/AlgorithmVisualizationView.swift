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
            .keyboardType(.decimalPad)
            .padding()
            
            Button(action: {
                UIApplication.shared.endEditing()
                self.viewModel.sortArray()
            }) {
                Text(viewModel.isSorting ? "Sorting..." : "Sort")
            }
            .buttonStyle(.bordered)
            .disabled(viewModel.isTextFieldEmpty || viewModel.isSorting)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewModel.currentOutputArray, id: \.self) { number in
                        Text("\(number)")
                            .frame(width: 30, height: 30)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .animation(.default, value: UUID())
                    }
                }
            }
            .padding()
            
            if !viewModel.isSorting {
                HStack {
                    Button(action: {
                        self.viewModel.stepBackward()
                    }) {
                        Image(systemName: "arrow.left")
                    }
                    .disabled(viewModel.currentStepIndex == 0)
                    
                    Spacer()
                    
                    Button(action: {
                        self.viewModel.stepForward()
                    }) {
                        Image(systemName: "arrow.right")
                    }
                    .disabled(viewModel.currentStepIndex == viewModel.stepArrays.count - 1 || viewModel.currentOutputArray.isEmpty)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

//#Preview {
//    AlgorithmVisualizationView()
//}
