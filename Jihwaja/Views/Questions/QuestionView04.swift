//
//  QuestionView04.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView04: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var jihwajaData : jihwajaData
    
    // 문구를 저장할 변수
    @State private var text : String = ""

    var body: some View {
            VStack{
                // 질문
                QuestionView(question: "💀 \(jihwajaData.A1)씨가 훗날 기억되길 원하는 문구가 있다면 적어주세요!")
                
                // 답변 영역
               Image("gravestone")
                    .overlay {
                        
                        // Placeholder
                        Text("이곳에 적어주세요")
                            .opacity(text.isEmpty ? 1 : 0)
                                
                        // 이미지의 크기에 맞춰 비율로 TextEditor 조정
                            GeometryReader{ geometry in
                                TextEditor(
                                    text: $text
                                )
                                
                                .padding(.top, geometry.size.height * 0.1)
                                .scrollContentBackground(.hidden)
                                .multilineTextAlignment(.center)
                                .frame(width: geometry.size.width * 0.7, height: geometry.size.height/2, alignment: .center)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .disabled(jihwajaData.isCompleted[3])
                            }
                    }
                .padding()
                
                Spacer()
                
                // 답변
                Button(action: {
                    jihwajaData.A4 = text
                    jihwajaData.isCompleted[3] = true
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    StoreButtonView(isActive: !text.isEmpty)
                }).disabled(text.isEmpty)
                    .opacity(jihwajaData.isCompleted[3] == true ? 0: 1)
            }
            .onAppear{
                text = jihwajaData.A4
            }
        
    }
}

struct QuestionView04_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView04(jihwajaData:.constant(jihwajaData.emptyData))
    }
}
