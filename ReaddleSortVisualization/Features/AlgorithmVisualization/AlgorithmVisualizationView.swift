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
                    UIApplication.shared.endEditing()
                    self.viewModel.sortArray()
                }) {
                    Text("Sort")
                }
                .buttonStyle(.bordered)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.sortedArray, id: \.self) { number in
                            Text("\(number)")
                                .frame(width: 40, height: 40)
                                .background(Color.blue)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .animation(.default, value: UUID())
                        }
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
        }
}

//#Preview {
//    AlgorithmVisualizationView()
//}