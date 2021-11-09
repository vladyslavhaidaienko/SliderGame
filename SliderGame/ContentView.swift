//
//  ContentView.swift
//  SliderGame
//
//  Created by Vladyslav Haidaienko on 08.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Double.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showAlert = false
//    var alpha = 0.5
    
    var body: some View {
        VStack {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к:")
                Text("\(lround(targetValue))")
            }
            .padding()
            HStack {
                Text("0")
                SliderUIKit(
                    sliderValue: $currentValue,
                    alpha: (currentValue >= targetValue) ? (targetValue / currentValue) : (currentValue / targetValue)
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
        let newValue = Double.random(in: 0...100)
        targetValue = newValue
    }
    
    private func computeScore() -> Int {
        let difference = abs(lround(targetValue) - lround(currentValue))
        return 100 - difference
    }
    
//    private func setAlphaForSliderThumb() {
//        if currentValue >= targetValue {
//            alpha = targetValue / currentValue
//        } else {
//            alpha = currentValue / targetValue
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
