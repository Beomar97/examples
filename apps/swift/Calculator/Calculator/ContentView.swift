//
//  ContentView.swift
//  Calculator
//
//  Created by Marco Forster on 19.04.22.
//

import SwiftUI

struct ContentView: View {
    @State var input1: String = ""
    @State var input2: String = ""
    @State var result: Int = 0
    @State var operand: String = "+"
    
    func calculate() -> Void {
        let a = Int(input1) ?? 0
        let b = Int(input2) ?? 0
        
        if operand == "+" {
            result = a + b
        } else if operand == "-" {
            result = a - b
        } else if operand == "*" {
            result = a * b
        } else {
            result = a / b
        }
    }
    
    var body: some View {
        VStack {
            Text("Calculator")
                .bold()
                .padding()
            
            TextField("Input 1", text: $input1,
            onEditingChanged: {t in calculate()},
            onCommit: {})
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
            .padding()
            
            HStack {
                Button(
                    action: {
                        operand = "+"
                        calculate()
                    },
                    label: {
                        Image(systemName: "plus.circle.fill")
                    }
                )
                .foregroundColor(
                    operand == "+" ? Color.green : Color.blue
                )
                .padding()
                
                Button(
                    action: {
                        operand = "-"
                        calculate()
                    },
                    label: {
                        Image(systemName: "minus.circle.fill")
                    }
                )
                .foregroundColor(
                    operand == "-" ? Color.green : Color.blue
                )
                .padding()
                
                Button(
                    action: {
                        operand = "*"
                        calculate()
                    },
                    label: {
                        Image(systemName: "multiply.circle.fill")
                    }
                )
                .foregroundColor(
                    operand == "*" ? Color.green : Color.blue
                )
                .padding()
                
                Button(
                    action: {
                        operand = "/"
                        calculate()
                    },
                    label: {
                        Image(systemName: "divide.circle.fill")
                    }
                )
                .foregroundColor(
                    operand == "/" ? Color.green : Color.blue
                )
                .padding()
            }
            
            TextField("Input 2", text: $input2,
            onEditingChanged: {t in calculate()},
            onCommit: {})
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
            .padding()
            
            Text(String(result))
                .bold()
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
