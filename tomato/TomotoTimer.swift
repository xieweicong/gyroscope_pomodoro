//
//  TomotoTimer.swift
//  tomato
//
//  Created by weicongxie on 2021/03/02.
//

import SwiftUI
import CoreMotion

class TomatoTimer: MotionModel, ObservableObject {
    @Published var timer: Timer? = nil
    @Published var nowTime: Int
    var startTime: Int
    var isRun: Bool
    @Published var count: Int = 0
    @Published var isFinish: Bool
    
    
    init(startTime: Int) {
        self.startTime = startTime * 60
        self.nowTime = self.startTime
        isRun = false
        isFinish = false
    }
    
    func startRun() {
        objectWillChange.send()
        isRun = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.nowTime > 0 {
                self.startGyroUpdates(self.endRun)
                self.nowTime -= 1
            }
            else {
                self.isFinish = true
                self.count += 1
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }
    
    func endRun() {
        objectWillChange.send()
        timer?.invalidate()
        timer = nil
        isRun = false
        isFinish = false
        self.nowTime = self.startTime
    }
    
    func changeTime(_ time: Int) {
        nowTime = time * 60
        startTime = time * 60
    }
}
