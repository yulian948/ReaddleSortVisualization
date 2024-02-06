//
//  UIApplicationExtensions.swift
//  ReaddleSortVisualization
//
//  Created by Yulian on 06.02.2024.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
