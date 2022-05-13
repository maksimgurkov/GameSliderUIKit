//
//  ContentView.swift
//  GameSliderSwiftUI
//
//  Created by Максим Гурков on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomValue = Int.random(in: 0...100)
    @State private var sliderValue = 50.0
    @State private var alertFlag = false
    @State private var section = 0
    var settingsColor = ["red", "green", "yellow"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack {
                        Picker(selection: $section,
                               label: Text("Настройка цвета бегунка")) {
                            ForEach(0..<settingsColor.count) {
                                Text(settingsColor[$0])
                            }
                        }
                    }
                }
                .padding(.bottom, 200)
                VStack {
                    TextView(value: randomValue)
                        .padding(.bottom, 10)
                    SliderView(value: $sliderValue,
                               valueRandom: randomValue,
                               color: colorRunner(),
                               alfa: resultGame())
                    .padding(.bottom, 10)
                    Button(action: {
                        alertFlag = true
                    }) {
                        Text("Проверь меня")
                    }
                    .alert("Резудьтат", isPresented: $alertFlag, actions: {}) {
                        Text("Вы набрали \(resultGame())")
                    }
                    .padding(.bottom, 15)
                    Button(action: {
                        randomValue = Int.random(in: 0...100)
                    }) {
                        Text("Начать заново")
                    }
                    .padding(.bottom, 200)
                    
                }
            }
        }
    }
    
    private func resultGame() -> Int {
        let result = abs(randomValue - lround(sliderValue))
        return 100 - result
    }
    
    private func colorRunner() -> UIColor {
        var color: UIColor = .black
        if section == 0 {
            color = .red
        } else if section == 1 {
            color = .green
        } else if section == 2 {
            color = .yellow
        }
        return color
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
