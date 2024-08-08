//
//  CameraPreview.swift
//  FactFinder
//
//  Created by Rafiq Rifhan Rosman on 2024/08/04.
//

import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    var previewLayer: AVCaptureVideoPreviewLayer

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}


struct CameraView: View {
    @StateObject private var cameraViewModel = CameraViewModel()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var documentScanner: DocScan
    
    
    
    var body: some View {
            VStack {
                CameraPreview(previewLayer: cameraViewModel.getPreviewLayer())
                    .edgesIgnoringSafeArea(.all)
                
                Spacer()
                
                Button(action: {
                    cameraViewModel.capturePhoto()
                }) {
                    Text("Capture Photo")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                if let capturedImage = cameraViewModel.capturedImage {
                    VStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Generate Text")
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Image(uiImage: capturedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                        
                        
                    }
                }
            }
            .onAppear {
                cameraViewModel.getPreviewLayer().frame = UIScreen.main.bounds
            }
            .onDisappear {
//                documentScanner.processImage(image: UIImage(named: "Image")!)
                if let capturedImage = cameraViewModel.capturedImage {
                      documentScanner.processImage(image: capturedImage)
                    
                }
            }
        }
}


