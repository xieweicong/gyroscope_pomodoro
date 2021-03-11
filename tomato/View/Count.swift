//
//  Count.swift
//  tomato
//
//  Created by weicongxie on 2021/03/03.
//

import SwiftUI

struct Count: View {
    var tomato: TomatoTimer
    var body: some View {
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

//struct Count_Previews: PreviewProvider {
//    static var previews: some View {
//        Count()
//    }
//}
