//
//  MotionModel.swift
//  tomato
//
//  Created by weicongxie on 2021/03/02.
//

import Foundation
import CoreMotion

class MotionModel {
    var motionManager = CMMotionManager()
    
    //刷新时间间隔
    let timeInterval: TimeInterval = 0.2
    var x: Double = 0
    var y: Double = 0
    var z: Double = 0
    
    @IBAction func getGyroData() {
        //获取数据
        self.motionManager.startGyroUpdates()
        if let gyroData = self.motionManager.gyroData {
            let rotationRate = gyroData.rotationRate
            x = rotationRate.x
            y = rotationRate.y
            z = rotationRate.z
        }
    }
    
    
    // 开始获取陀螺仪数据
    func startGyroUpdates(_ Do:@escaping () -> Void) {
        
        //设置刷新时间间隔
        self.motionManager.gyroUpdateInterval = self.timeInterval
        
        //开始实时获取数据
        let queue = OperationQueue.current
        self.motionManager.startGyroUpdates(to: queue!, withHandler: { (gyroData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            // 有更新
            if self.motionManager.isGyroActive {
                if let rotationRate = gyroData?.rotationRate {
                    if abs(rotationRate.x - self.x) > 0.3 || abs(rotationRate.y - self.y) > 0.3 || abs(rotationRate.y - self.y) > 0.3 {
                        Do()
                    }
                }
            }
        })
    }
}
