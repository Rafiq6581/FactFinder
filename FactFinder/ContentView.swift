//
//  ContentView.swift
//  FactFinder
//
//  Created by Rafiq Rifhan Rosman on 2024/08/04.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var answerer = BERT()
    @State private var answer = ""
    @State private var isEditing = false
    @State private var question = ""
    
//    @StateObject private var cameraViewModel = CameraViewModel()
    @State var text: String = "No text to display"
    @StateObject var documentScanner = DocScan()
    
//    var image = UIImage(named: "Image")!

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.green]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    
                    ScrollView {
                        Text(documentScanner.text)
                        
                    }
                    .frame(maxWidth: 340, maxHeight:250)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 9.0))
                    
                    HStack {
                        NavigationLink(destination: CameraView(documentScanner: documentScanner)) {
                            Image(systemName: "doc.viewfinder")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                        
                        Text("Scan Text")
                            .foregroundStyle(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .padding()
                    VStack(spacing: 20) {
                        
                        Text(answer)
                            .frame(maxWidth: 340, maxHeight:50)
                            .background(.ultraThinMaterial)
                            .clipShape(.rect(cornerRadius: 9.0))

                        HStack(spacing: 10) {
                            TextField("What do you want to know?", text: $question, onEditingChanged: { editing in
                                isEditing = editing
                            })
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .frame(maxWidth: 265, maxHeight: 50)
                            .background(Color(.systemGray4))
                            .clipShape(Capsule())
                            
                            if isEditing {
                                Button(action: {
                                    // Action when button is tapped
                                    print("Button tapped")
                                    self.answer = String(answerer.findAnswer(for: question, in: documentScanner.text))
                                }) {
                                    Image(systemName: "arrow.up.circle")
                                        .padding(10)
                                        .background(Color(.systemGray4))
                                        .foregroundColor(.gray)
                                        .clipShape(Capsule())
                                }
                                .padding(.trailing, 10)
                            }
                        }
                    }
                }
                .onDisappear {
                    documentScanner.text = ""
                }
            }
            .navigationTitle("TLDR")
        }

    }
    
}


#Preview {
    ContentView()
}
