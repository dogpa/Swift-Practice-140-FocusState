//
//  ttt.swift
//  Swift Practice 140 FocusState
//
//  Created by Dogpa's MBAir M1 on 2022/3/18.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var hint: String           //提示文字
    @Binding var iputString: String     //輸入者輸入的內容string
    @Binding var incorrectInfo: Bool    //是否正確的Bool值 true / false 會有不同的顏色
    var body: some View {
        VStack(spacing: 5){
            TextField("\(hint)", text: $iputString)
                .multilineTextAlignment(.center).padding()
                .frame(width: 300, height: 50)
            
                //background依照incorrectInfo的true false給予不同的顏色外框
                .background(incorrectInfo ? RoundedRectangle(
                    cornerRadius: 10, style: .continuous)
                                .stroke(Color.red, lineWidth: 5) : RoundedRectangle(
                    cornerRadius: 10, style: .continuous)
                                .stroke(Color.green, lineWidth: 2))
                .padding(10)
        }
    }
}
