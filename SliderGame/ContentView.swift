//
//  ContentView.swift
//  SliderGame
//
//
//  Created by Vladyslav Haidaienko on 08.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к:")
                Text("\(targetValue)")
            }
            .padding()
            HStack {
                Text("0")
                SliderUIKit(
                    sliderValue: $currentValue,
                    alpha: computeScore()
                )
                Text("100")
            }
            .padding()
            
            Button("Проверь меня!") { self.showAlert = true
            }
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(computeScore())")
            }
            .padding(.bottom, 20)
            
            Button("Начать заново") {
                updateTargetValue()
            }
        }
    }
    
    private func updateTargetValue() {
        let newValue = Int.random(in: 0...100)
        targetValue = newValue
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
