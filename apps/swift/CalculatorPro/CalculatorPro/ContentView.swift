//
//  ContentView.swift
//  CalculatorPro
//
//  Created by Marco Forster on 19.04.22.
//

import SwiftUI

struct ContentView: View {
    @State var result = 0
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    Spacer()
                    Text(String(result))
                        .font(.largeTitle)
                        .padding()
                }
                .foregroundColor(.white)
                .background(.black)
            
                Spacer()
            }
            
            Group {
            
            HStack {
                Spacer()
                Image(systemName: "arrowshape.turn.up.left.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "plusminus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "circle.slash.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "divide.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "7.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "8.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "9.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "multiply.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "4.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "5.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "6.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "1.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "2.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "3.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "0.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "smallcircle.filled.circle.fill")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.white)
                Spacer()
                Image(systemName: "equal.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                Spacer()
            }
            
            Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
