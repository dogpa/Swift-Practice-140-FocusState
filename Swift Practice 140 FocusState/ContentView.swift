//
//  ContentView.swift
//  Swift Practice 140 FocusState
//
//  Created by Dogpa's MBAir M1 on 2022/3/16.
//

import SwiftUI



struct ContentView: View {
    
    @FocusState private var focusedField: Field?        //設定接收FocusState
    @State var recipient = "請輸入收件人"                 //TextField hint
    @State var address = "請輸入收件地址"                  //TextField hint
    @State var phone = "收件人手機"                       //TextField hint
    @State var inputRecipient = ""                      //接收輸入收件人
    @State var inputAddress = ""                        //接收輸入地址
    @State var inputPhoneNo = ""                        //接收輸入電話
    @State var recipientInCo = false                    //接收是否有輸入文字
    @State var addressInCo = false                      //接收是否有輸入文字
    @State var phoneNoInCo = false                      //接收是否有輸入文字
    
    var body: some View {
        VStack{
            
            Spacer()
            
            //收件人的TextField
            TextFieldView(hint: $recipient, iputString: $inputRecipient, incorrectInfo: $recipientInCo).focused($focusedField, equals: .recipient).textContentType(.name)
           
            //地址的TextField
            TextFieldView(hint: $address, iputString: $inputAddress, incorrectInfo: $addressInCo).focused($focusedField, equals: .address)
            
            //電話的TextField
            TextFieldView(hint: $phone, iputString: $inputPhoneNo, incorrectInfo: $phoneNoInCo).focused($focusedField, equals: .phone).keyboardType(.numberPad).textContentType(.telephoneNumber)
            Spacer()
            
            //送出按鈕，執行檢查的 checkInfoCorrect()
            Button(action: {
                checkInfoCorrect()
            }, label: {
                Text("送出訂單").font(.system(size: 20).bold())
            }).padding().background(Capsule(style: .continuous).stroke(Color.yellow,lineWidth: 5))
            Spacer()
        }
    }
    
    ///判斷是否有輸入值，按下Button使用
    func checkInfoCorrect () {
        
        //依序若有空白的TextField給予@FocusState
        if inputRecipient.isEmpty {
            focusedField = .recipient
            print("收件人空白")
        } else if inputAddress.isEmpty {
            focusedField = .address
            print("地址空白")
        } else if inputPhoneNo.isEmpty {
            focusedField = .phone
            print("電話空白")
        }else {
            UIApplication.shared.endEditing()
        }
        
        //若字串為空字串給予textField的binding的incorrectInfo為true使其變色
        //收件人
        recipientInCo = checkEmptyString(text: inputRecipient)
        
        //地址
        addressInCo = checkEmptyString(text: inputAddress)
        
        //電話
        phoneNoInCo = checkEmptyString(text: inputPhoneNo)
        
    }
    
    /// 判斷字串是否為空字串，若是回傳true 有輸入則輸入false
    /// - Parameters:
    ///    - text: 欲檢查的字串
    /// - Returns: 參數string是否為空字串
    func checkEmptyString (text:String) -> Bool {
        switch text {
        case "" :
            return true
        default :
            return false
        }
    }
}


///自定義TextField的View製作一個多個使用


//判斷@FocusState位置的地方
enum Field: Hashable {
    case recipient
    case address
    case phone
}

//透過extension收鍵盤
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


