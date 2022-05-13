//
//  SliderUIKitView.swift
//  GameSliderUIKit
//
//  Created by Максим Гурков on 12.05.2022.
//

import SwiftUI

struct SliderUIKitView: UIViewRepresentable {
    
    @Binding var value: Double
    
    let color: UIColor
    let alfa: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChange(_:)),
                         for: .valueChanged)
        
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alfa) / 100)
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
}

extension SliderUIKitView {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChange(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUIKitView_Preview: PreviewProvider {
    static var previews: some View {
        SliderUIKitView(value: .constant(50), color: .yellow, alfa: 100)
    }
}
