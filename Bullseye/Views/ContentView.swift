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
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            }
        }
    }
}

struct HitMeButtonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            alertIsVisible = true
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .alert(isPresented: $alertIsVisible, content: {
            let roundedValue = Int(sliderValue.rounded())
        
            return Alert(title: Text("Hello There!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round"), dismissButton: .default(Text("Awesome!")))
        })
        .padding(20.0)
        .foregroundColor(Color.white)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
            }
        )
        .cornerRadius(21.0)
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100)
                .foregroundColor(Color("TextColor"))
            SliderLabelText(text: "100")
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionsText(text: "🎯🎯🎯\nPut Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
