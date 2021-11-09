//
//  SliderUIKit.swift
//  SliderGame
//
//  Created by Vladyslav Haidaienko on 09.11.2021.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    @Binding var sliderValue: Double
    var alpha: Double
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .init(red: 1, green: 0, blue: 0, alpha: alpha)
        slider.value = Float(sliderValue)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
    }
    
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(sliderValue: .constant(69), alpha: 0.3)
    }
}
