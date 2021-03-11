//
//  ContentView.swift
//  tomato
//
//  Created by weicongxie on 2021/02/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tomato: TomatoTimer
    @State var speed: Double = 25.0
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Slider(
                    value: $speed,
                    in: 1...60,
                    step: 1,
                    onEditingChanged: { editing in
                        tomato.endRun()
                        tomato.changeTime(Int(speed))
                    })
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 250, height: 250)
                    if !tomato.isFinish && !tomato.isRun && !tomato.isMove {
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
                    else if tomato.isMove {
                        Text("DON'T MOVE")
                    }
                    else {
                        Text("YOU MADE IT!")
                    }
                }
                .foregroundColor(.black)
                .font(.largeTitle)
                .padding(20)
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
                HStack {
                    Text("TODAY")
                        .foregroundColor(.white)
                    ForEach(0..<tomato.count, id: \.self) { index in
                        Circle()
                            .fill(Color.white)
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tomato: TomatoTimer(startTime: 25))
    }
}
