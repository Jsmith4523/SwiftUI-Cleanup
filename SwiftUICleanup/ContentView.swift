//
//  ContentView.swift
//  SwiftUICleanup
//
//  Created by Jaylen Smith on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedImage: UIImage?
    
    @State private var showActivityController = false
    @State private var showImagePicker = false
    @State private var showSafariView = false
    
    var body: some View {
        VStack {
            if let selectedImage {
                VStack {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text("One Beautiful Image!!")
                        .font(.system(size: 18))
                    Button("Remove", role: .destructive) {
                        self.selectedImage = nil
                    }
                }
            }
            Button("Show Image Picker") {
                showImagePicker.toggle()
            }
            .padding()
            .frame(width: 300)
            .background(.black)
            .cornerRadius(30)
            .foregroundColor(.white)
            Button("Safari View") {
                showSafariView.toggle()
            }
            .padding()
            .frame(width: 300)
            .background(.black)
            .cornerRadius(30)
            .foregroundColor(.white)
            if selectedImage.isNil() {
                Button("Share image") {
                    showActivityController.toggle()
                }
                .padding()
                .frame(width: 300)
                .background(.black)
                .cornerRadius(30)
                .foregroundColor(.white)
            }
        }
        .photoPicker(isPresented: $showImagePicker, selectedImage: $selectedImage)
        .safariView(isPresented: $showSafariView, url: URL(string: "https://www.apple.com")!)
        .activityController(isPresented: $showActivityController, items: [selectedImage ?? UIImage(systemName: "person")!])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
