//
//  VerifySuccessView.swift
//  DoItNow
//
//  Created by Arnold Therigan on 28/07/25.
//

import SwiftUI

struct VerifySuccessView: View {
    var body: some View {
        VStack() {
            Spacer().frame(height: 60)
            Text(GENERAL_WORDING.appTitle).font(.system(size: 28, weight: .bold)).foregroundColor(.blue).padding(.bottom, 6)
            Text(GENERAL_WORDING.appDescription).foregroundColor(.gray)
            Spacer().frame(height: 30)
            Text(GETTING_STARTED_WORDING.verifyAccount).padding(.bottom, 25)
            
            Image(IMAGE_WORDING.verifySuccess)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            Text(GETTING_STARTED_WORDING.verifySuccessDesc).padding(.top, 25)
            
            Spacer()
            
            Button(GETTING_STARTED_WORDING.goToDashboardCTA) {
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarBackButtonHidden(true)
    }
}
