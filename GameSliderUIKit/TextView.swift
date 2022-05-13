//
//  TextView.swift
//  GameSliderSwiftUI
//
//  Created by Максим Гурков on 12.05.2022.
//

import SwiftUI

struct TextView: View {
    
    var value: Int
    
    var body: some View {
        Text("Попробуй максимально придвинуться к \(value)")
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(value: 10)
    }
}
