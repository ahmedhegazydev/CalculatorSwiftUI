//
//  ContentView.swift
//  CalculatorIosSwiftUi
//
//  Created by Ahmed Hegazy on 2/9/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import SwiftUI
import UIKit
import Toaster


enum CalcCases : String{
    case devide, add, minus, multiply, equals
    case zero, one, two, three, four, five, six, seven, eight, nine
    case ac, plusMinus, reminder
    case dot;
    
    
    var title: String{
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
            
        case .ac: return "AC"
        case .reminder: return "%"
        case .plusMinus: return "+/-"
            
        case .devide: return "/"
        case .add: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .equals: return "="
            
        case .dot: return "."
        default: return ""
        }
        
    }
    
    //var background: UIColor{
    var background: Color{
        switch self {
        case .devide, .add, .minus, .multiply, .equals:
            return Color.blue
            //return UIColor.blue
        //break
        case .zero, .one, .two, .three, .five, .six, .seven, .eight, .nine, .dot:
            //return UIColor.lightGray
            return Color(.lightGray)
            
        case .ac, .plusMinus, .reminder:
            //return UIColor.darkGray
            return Color(.darkGray)
        default:
            return Color(.lightGray)
            //break
        }
    }
    
    
}


class GlobaleEnvironment: ObservableObject{
    
    @Published var displayRes = ""
    
    func receiveInput(button: CalcCases){
        self.displayRes = button.title
        
        switch button {
        case .zero:
            Toast(text: button.rawValue).show()
            
            break
        case .one:
            Toast(text: button.rawValue).show()
            
            break
        case .two:
            
            break
        case .three:
            
            break
        case .four:
            
            break
        case .five:
            
            break
        case .six:
            
            break
        case .seven:
            
            break
        case .eight:
            
            break
        case .nine:
            
            
            break
        case .ac:
            
            break
        case .reminder:
            
            break
        case .plusMinus:
            
            
            break
        case .devide:
            
            break
        case .add:
            
            break
        case .minus:
            
            break
        case .multiply:
            
            break
        case .equals:
            
            break
        case .dot:
            
            break
        default:
            
            break
        }
    }
    
}

struct ContentView: View {
    
    
    @EnvironmentObject var env: GlobaleEnvironment
    
    
    //    let charachers = [
    //        ["AC", "", "%", "/"],
    //        ["7", "8", "9", "X"],
    //        ["4", "5", "6", "-"],
    //        ["1", "2", "3", "+"],
    //        ["0", ".", ".", "="]
    //    ]
    let charachers : [[CalcCases]] = [
        [.ac, .plusMinus, .reminder, .devide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .add],
        [.zero, .dot, .equals],
    ]
    
    var body: some View {
        
        //ZStack(alignment: .bottom){
        ZStack (alignment: Alignment.bottom){
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack{
                //            HStack{
                //                Text("0").font(.system(size: 20))
                //                Text("0").font(.system(size: 20))
                //                Text("0").font(.system(size: 20))
                //                Text("0").font(.system(size: 20))
                //            }
                HStack{
                    Spacer()
                    Text(verbatim: env.displayRes)
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                        .padding()
                    
                }.padding()
                
                VStack(spacing: CGFloat(10)){
                    ForEach(charachers, id: \.self){ row in
                        HStack(spacing: CGFloat(10)){
                            //                    ForEach(["7", "8", "9", "X"], id: \.self) { button in
                            //                        Text(button)
                            //                            .font(.system(size: 30))
                            //                            .frame(width: 50, height: 50)
                            //                    }
                            
                            
                            ForEach(row, id: \.self){ button in
                                //ForEach(row.items){button in
                                CalculatorButtonView(button: button)
                                
                            }
                            
                        }
                    }
                }.padding(.bottom)
                
            }
        }
        
        
    }
}


struct CalculatorButtonView: View {
    
    var button: CalcCases
    @EnvironmentObject var env : GlobaleEnvironment
    
    
    var body: some View {
        
        Button(action: {
            
            //self.env.displayRes = button.title;
            self.env.receiveInput(button: self.button)
            
        }){
            Text(verbatim: button.title)
                .font(.system(size: 30))
                //.frame(width: 80, height: 80)
                .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5  * 12) / 4)
                .foregroundColor(.white)
                //.background(Color.yellow)
                //.background(Color.blue)
                .background(button.background)
                //.cornerRadius(50)
                .cornerRadius(self.buttonWidth(button: button))
        }
        
    }
    
    
    private func buttonWidth(button: CalcCases) -> CGFloat{
        switch button {
        case .zero:
            return (UIScreen.main.bounds.width - 4  * 12) / 4 * 2;
        default:
            return (UIScreen.main.bounds.width - 5 * 12) / 4;
        }
        //return (UIScreen.main.bounds.width - 5 * 12) / 4;
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        ContentView().environmentObject(GlobaleEnvironment())
    }
}
