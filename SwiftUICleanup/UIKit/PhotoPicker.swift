//
//  PhotoPicker.swift
//  SwiftUICleanup
//
//  Created by Jaylen Smith on 3/8/23.
//

import Foundation
import SwiftUI
import UIKit

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    
    @StateObject private var pickerManager = ImagePickerManager()
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker             = UIImagePickerController()
        imagePicker.sourceType      = .photoLibrary
        imagePicker.delegate        = context.coordinator
        imagePicker.allowsEditing   = true
        
        return imagePicker
    }
    
    func makeCoordinator() -> ImagePickerManager {
        pickerManager
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        if let image = context.coordinator.selectedImage {
            self.selectedImage = image
        }
    }
    
    typealias UIViewControllerType = UIImagePickerController
    
    
    final class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ObservableObject {
        
        @Published var selectedImage: UIImage?
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                selectedImage = image
            }
            picker.dismiss(animated: true)
        }
    }
}
