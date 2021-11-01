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
                Text("🎯🎯🎯\nPut Bullseye as close as you can to".uppercased())                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                Text(String(game.target))
                    .kerning(-1)
                    .fontWeight(.black)
                    .font(.largeTitle)
                HStack {
                    Text("1")
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    Slider(value: self.$sliderValue, in: 1.0...100)
                        .foregroundColor(Color("TextColor"))
                    Text("100")
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                }
                Button(action: {
                    self.alertIsVisible = true
                }) {
                    Text("Hit me".uppercased())
                        .bold()
                        .font(.title3)
                }
                .alert(isPresented: $alertIsVisible, content: {
                    let roundedValue = Int(self.sliderValue.rounded())
                
                    return Alert(title: Text("Hello There!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round"), dismissButton: .default(Text("Awesome!")))
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
