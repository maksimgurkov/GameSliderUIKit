//
//  SliderView.swift
//  GameSliderSwiftUI
//
//  Created by Максим Гурков on 12.05.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    
    var valueRandom: Int
    var color: UIColor
    var alfa: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("0")
                SliderUIKitView(value: $value, color: color, alfa: alfa)
                Text("100")
            }
            .padding()
            
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50), valueRandom: 50, color: .yellow, alfa: 100)
    }
}
