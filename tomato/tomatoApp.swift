//
//  tomatoApp.swift
//  tomato
//
//  Created by weicongxie on 2021/02/28.
//

import SwiftUI

@main
struct tomatoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(tomato: TomatoTimer(startTime: 25))
        }
    }
}
