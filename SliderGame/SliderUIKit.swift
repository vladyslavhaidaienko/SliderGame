//
//  SliderUIKit.swift
//  SliderGame
//
//
//  Created by Vladyslav Haidaienko on 09.11.2021.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    @Binding var sliderValue: Double
    
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue)
    }
}

extension SliderUIKit {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(value: Binding<Double>) {
            self._sliderValue = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(sliderValue: .constant(69), alpha: 100)
    }
}
