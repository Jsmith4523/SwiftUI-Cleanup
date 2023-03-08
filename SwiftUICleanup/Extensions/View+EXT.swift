//
//  View+EXT.swift
//  SwiftUICleanup
//
//  Created by Jaylen Smith on 3/8/23.
//

import Foundation
import SwiftUI

extension View {
    
    func activityController(isPresented: Binding<Bool>, items: [Any]) -> some View {
        return self
            .sheet(isPresented: isPresented) {
                ActivityController(items: items)
            }
    }
    
    func photoPicker(isPresented: Binding<Bool>, selectedImage: Binding<UIImage?>) -> some View {
        return self
            .sheet(isPresented: isPresented) {
                PhotoPicker(selectedImage: selectedImage)
            }
    }
    
    func safariView(isPresented: Binding<Bool>, url: URL) -> some View {
        return self
            .sheet(isPresented: isPresented) {
                SafariView(url: url)
            }
    }
}

extension UIImage? {
    
    func isNil() -> Bool {
        !(self == nil)
    }
}
