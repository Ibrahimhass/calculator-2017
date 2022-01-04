//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Swiftify on 04/01/22.
//

//  Converted by Storyboard to SwiftUI Converter - https://swiftify.com/converter/storyboard2swiftui

import SwiftUI

// --------------------------------------------------------------------------------
// ViewController
// --------------------------------------------------------------------------------
struct View1: View {
    @State var brain = CalculatorBrain()
    @State var display = ""
    @State var descriptionDisplay = ""
    @State var userIsInTheMiddleOfTyping = false
    @State var variables: [String: Double] = [:]
    let decimalSeparator = NumberFormatter().decimalSeparator ?? ""
    
    var displayValue: Double {
        return (NumberFormatter().number(from: display)?.doubleValue)!
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { geometry in
                VStack() {
                    HStack() {
                        Text(descriptionDisplay)
                            .frame(dynamicWidth: 5, dynamicHeight: 32, alignment: .trailing)
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.0, green: 0.0, blue: 1.0))
                        
                        Spacer().frame(dynamicWidth: 0)
                        
                        Text(descriptionDisplay)
                            .frame(dynamicWidth: 662, dynamicHeight: 32, alignment: .trailing)
                            .font(.system(size: 30, weight: .regular))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(white: 1.0))
                    }
                    .frame(dynamicWidth: 667, dynamicHeight: 32)
                    
                    Spacer().frame(dynamicHeight: 1)
                    
                    Text(display)
                        .frame(dynamicWidth: 667, dynamicHeight: 48, alignment: .trailing)
                        .font(.system(size: 40, weight: .regular))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(white: 1.0))
                    
                    Spacer().frame(dynamicHeight: 1)
                    
                    VStack() {
                        Group {
                            HStack() {
                                Button(action: {
                                    reset()
                                }) {
                                    Text("C").lineLimit(1).font(.system(size: 30, weight: .regular))
                                        .frame(dynamicWidth: 166, dynamicHeight: 48, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                
                                Spacer().frame(dynamicWidth: 1)
                                
                                Button(action: {
                                    undo()
                                }) {
                                    Text("CE").lineLimit(1).font(.system(size: 30, weight: .regular))
                                        .frame(dynamicWidth: 166, dynamicHeight: 48, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                
                                Spacer().frame(dynamicWidth: 1)
                                
                                Button(action: {
                                    storeToMemory()
                                }) {
                                    Text("→M").lineLimit(1).font(.system(size: 30, weight: .regular))
                                        .frame(dynamicWidth: 166, dynamicHeight: 48, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(white: 1.0))
                                .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                                
                                Spacer().frame(dynamicWidth: 1)
                                
                                Button(action: {
                                    callMemory()
                                }) {
                                    Text("M").lineLimit(1).font(.system(size: 30, weight: .regular))
                                        .frame(dynamicWidth: 166, dynamicHeight: 48, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(white: 1.0))
                                .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                            }
                            .frame(dynamicWidth: 667, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        reset()
                                    }) {
                                        Text("C").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        undo()
                                    }) {
                                        Text("CE").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("x²")
                                    }) {
                                        Text("x²").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("√")
                                    }) {
                                        Text("√").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("✅")
                                    }) {
                                        Text("✅").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        performOperation("rand")
                                    }) {
                                        Text("rand").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("÷")
                                    }) {
                                        Text("÷").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 667, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        performOperation("xʸ")
                                    }) {
                                        Text("xʸ").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("eˣ")
                                    }) {
                                        Text("eˣ").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("10ˣ")
                                    }) {
                                        Text("10ˣ").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit("7")
                                    }) {
                                        Text("7").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit("8")
                                    }) {
                                        Text("8").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        touchDigit("9")
                                    }) {
                                        Text("9").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("×")
                                    }) {
                                        Text("×").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 667, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        performOperation("x⁻¹")
                                    }) {
                                        Text("x⁻¹").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("ln")
                                    }) {
                                        Text("ln").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("log")
                                    }) {
                                        Text("log").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit("4")
                                    }) {
                                        Text("4").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit("5")
                                    }) {
                                        Text("5").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        touchDigit(("6"))
                                    }) {
                                        Text("6").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("-")
                                    }) {
                                        Text("-").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 667, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        storeToMemory()
                                    }) {
                                        Text("→M").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(white: 1.0))
                                    .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("sin")
                                    }) {
                                        Text("sin").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("cos")
                                    }) {
                                        Text("cos").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit("1")
                                    }) {
                                        Text("1").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit("2")
                                    }) {
                                        Text("2").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        touchDigit("3")
                                    }) {
                                        Text("3").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("+")
                                    }) {
                                        Text("+").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 667, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                        }
                        
                        Group {
                            HStack() {
                                Group {
                                    Button(action: {
                                        callMemory()
                                    }) {
                                        Text("M").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(white: 1.0))
                                    .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("sinh")
                                    }) {
                                        Text("sinh").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("cosh")
                                    }) {
                                        Text("cosh").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {}) {
                                        Text("±").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit("0")
                                    }) {
                                        Text("0").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        touchDigit(".")
                                    }) {
                                        Text(".").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation("=")
                                    }) {
                                        Text("=").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 94.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 667, dynamicHeight: 48)
                        }
                    }
                    .frame(dynamicWidth: 667, dynamicHeight: 293)
                }
                .frame(dynamicWidth: 667, dynamicHeight: 375)
            }
        }
        .frame(dynamicWidth: 667, dynamicHeight: 375)
        .background(Color(red: 0.6, green: 0.6, blue: 0.6))
        .edgesIgnoringSafeArea(.all)
    }
}

extension View1 {
    
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.light)
    }
}
