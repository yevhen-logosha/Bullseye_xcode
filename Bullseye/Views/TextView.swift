//
//  TextView.swift
//  Bullseye
//
//  Created by Yevhen Lohosha on 01/11/2021.
//

import SwiftUI

struct InstructionsText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1)
            .fontWeight(.black)
            .font(.largeTitle)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
        InstructionsText(text: "Instructions")
        BigNumberText(text: "999")
        SliderLabelText(text: "1")
        }
    }
}
