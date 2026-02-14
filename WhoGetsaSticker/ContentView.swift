//
//  ContentView.swift
//  WhoGetsaSticker
//
//  Created by Jorge Caraballo on 2/13/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var winningMessage = ""
    @State private var posters: [String] = []
    @State private var name = ""
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            Text("Who Gets a Sticker?")
                .font(.largeTitle)
                .fontWeight(.black)
            
            HStack {
                Button("Clear") {
                    posters.removeAll()
                    name = ""
                    winningMessage = ""
                    textFieldIsFocused = false
                }
                .tint(.red.opacity(0.8))
                
                Spacer()
                
                Button("Pick a Winner") {
                    winningMessage = "This Week's Winner is:\n\(posters.randomElement() ?? "no one")"
                    name = ""
                    textFieldIsFocused = false
                }
                .tint(.green.opacity(0.8))
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .bold()
            .disabled(posters.isEmpty)
            
            Image("sticker")
                .resizable()
                .scaledToFit()
            
            Text(winningMessage)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            Text("This Week's Posters Are:")
                .font(.largeTitle)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
            
            Text(posters.isEmpty ? "No Posters This Week" : posters.joined(separator: ", "))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            HStack {
                TextField("enter name", text: $name)
                    .font(.title2)
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                    }
                    .autocorrectionDisabled()
                    .focused($textFieldIsFocused)
                
                Button {
                    posters.append(name)
                    name = ""
                    textFieldIsFocused = false
                } label: {
                    Image(systemName: "plus")
                }
                .bold()
            }
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
