//
//  ActivityController.swift
//  SwiftUICleanup
//
//  Created by Jaylen Smith on 3/8/23.
//

import Foundation
import SwiftUI
import UIKit


struct ActivityController: UIViewControllerRepresentable {
    
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return activityController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
    
    typealias UIViewControllerType = UIActivityViewController
    
}
