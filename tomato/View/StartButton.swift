//
//  StartButton.swift
//  tomato
//
//  Created by weicongxie on 2021/03/03.
//

import SwiftUI

struct StartButton: View {
    var tomato: TomatoTimer
    
    var body: some View {
        Button(action: {
            if !tomato.isRun {
                tomato.getGyroData()
                tomato.startRun()
            }
            if tomato.isFinish {
                tomato.endRun()
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 250, height: 80)
                Text("START")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            
        }.padding(20)
    }
}

//struct StartButton_Previews: PreviewProvider {
//    static var previews: some View {
//        StartButton(tomato: tomato)
//    }
//}
