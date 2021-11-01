//
//  ContentView.swift
//  Bullseye
//
//  Created by Yevhen Lohosha on 01/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CANN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1)
                .fontWeight(.black)
                .font(.largeTitle)
            HStack {
                Text("1")
                    .fontWeight(.bold)
                Slider(value: self.$sliderValue, in: 1.0...100)
                Text("100")
                    .fontWeight(.bold)
            }
            Button(action: {
                print("Hello Swiftui")
                self.alertIsVisible = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int(self.sliderValue.rounded())
            
                return Alert(title: Text("Hello There!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round"), dismissButton: .default(Text("Awesome!")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
