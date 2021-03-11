//
//  TimeDisplay.swift
//  tomato
//
//  Created by weicongxie on 2021/03/03.
//

import SwiftUI

struct TimeDisplay: View {
    var tomato: TomatoTimer
    var speed: Double
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 250, height: 250)
            if !tomato.isFinish && !tomato.isRun {
                HStack {
                    Text(String(Int(speed)))
                    Text(":")
                    Text(String(format: "%.2d", Int(speed) * 60 % 60))
                }
            }
            else if tomato.isRun {
                HStack {
                    Text(String(tomato.nowTime / 60))
                    Text(":")
                    Text(String(format: "%.2d", tomato.nowTime % 60))
                }
                
            }
            else {
                Text("YOU MADE IT!")
            }
        }
        .foregroundColor(.black)
        .font(.largeTitle)
        .padding(20)
    }
}
//
//struct TimeDisplay_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeDisplay()
//    }
//}
