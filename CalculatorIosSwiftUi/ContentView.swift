//
//  ContentView.swift
//  CalculatorIosSwiftUi
//
//  Created by Ahmed Hegazy on 2/9/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let charachers = [
        ["7", "8", "9", "X"],
        ["7", "8", "9", "X"],
        ["7", "8", "9", "X"]
    ]
    
    var body: some View {
        
        ZStack(alignment: .bottom){
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
                    Text("Res").foregroundColor(.white)
                        .font(.system(size: 30))
                }.padding()
                
                VStack{
                    ForEach(charachers, id: \.self){ row in
                        HStack{
                            //                    ForEach(["7", "8", "9", "X"], id: \.self) { button in
                            //                        Text(button)
                            //                            .font(.system(size: 30))
                            //                            .frame(width: 50, height: 50)
                            //                    }
                            ForEach(row, id: \.self) { button in
                                Text(button)
                                    .font(.system(size: 30))
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                                
                            }
                            
                        }
                    }
                }
                
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
