//
//  Safari.swift
//  SwiftUICleanup
//
//  Created by Jaylen Smith on 3/8/23.
//

import Foundation
import SafariServices
import UIKit
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let controller = SFSafariViewController(url: url)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
    
    typealias UIViewControllerType = SFSafariViewController
        
}
