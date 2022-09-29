  //
  //  OnboardingView.swift
  //  Restart
  //
  //  Created by kangmin on 2022/09/27.
  //

import SwiftUI

struct OnboardingView: View {
  

  // MARK: - PROPERTY
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0
  
  // MARK: - body
  
  var body: some View {
    ZStack {
      
      Color("ColorBlue")
        .ignoresSafeArea(.all, edges: .all)
      
      VStack(spacing: 20) {
        Spacer()
        
        VStack(spacing: 0) {
          Text("Share.")
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
          Text("""
                    문장 문장 문장
                    문장 문장 문장
                    """)
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 10)
        }
        
        // MARK: - CENTER
        
        ZStack {
          CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
          
          Image("character-1")
            .resizable()
            .scaledToFit()
        }
        
        Spacer()
        
        // MARK: - FOOTER
        
        ZStack {
          // 1. background
          
          Capsule()
            .fill(Color.white.opacity(0.2))
          
          Capsule()
            .fill(Color.white.opacity(0.2))
            .padding(8)
          
          // 2. call-to-action
          
          Text("밀어서 시작하기")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 20)
          
          // 3. capsule
          
          HStack {
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: buttonOffset + 80)
            
            Spacer()
          }
          
          // 4. circle
          
          HStack {
            ZStack {
              Circle()
                .fill(Color("ColorRed"))
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .offset(x: buttonOffset)
            .gesture(
              DragGesture()
                .onChanged { gesture in
                  if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                    buttonOffset = gesture.translation.width
                  }
                }
                .onEnded { _ in
                  if buttonOffset > buttonWidth / 2 {
                    buttonOffset = buttonWidth - 80
                    isOnboardingViewActive = false
                  } else {
                    buttonOffset = 0
                  }
                }
            ) //: GESTURE
            
            Spacer()
          } //: HSTACK
        } //: FOOTER
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
      } //: VSTACK
    } //: ZSTACK
  }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
