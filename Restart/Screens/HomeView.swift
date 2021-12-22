//
//  HomeView.swift
//  Restart
//
//  Created by Yannick Fumukani on 12/20/21.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            //            Color("ColorRed")
            //            .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                
                // MARK: - HEADER
                Spacer()
                
                ZStack {
                    
                    CircleGroupView(ShapeColor: Color("ColorBlue"), ShapeOpacity: 0.2)
                    
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            .easeOut(duration: 4)
                                .repeatForever(),
                            value: isAnimating)
                }
                // MARK: - CENTER
                
                Text("The time that leads to mastery is dependent on the intensity of our focus!")
                    .font(.title3)
                    .fontWeight(.black)
                    .padding()
                    .foregroundColor(.secondary)
                    .opacity(isAnimating ? 1:0)
                    .offset(y: isAnimating ? 0 : 40)
                    .animation(.easeOut(duration: 0.7), value: isAnimating)
                
                //                ButtonX(text: "Unlock with Face Id", logo: "faceid").onTapGesture {
                //                    print("Hello world")
                //                }
                
                // MARK: - Footer
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.easeOut(duration: 0.7)){
                        isOnboardingViewActive = true
                    }
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .opacity(isAnimating ? 1:0)
                .offset(y: isAnimating ? 0 : 80)
                .animation(.easeOut(duration: 0.7), value: isAnimating)
                
            }
        } //: VSTACK
        .onAppear(perform: {
            //isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
        .onDisappear(perform: {
            isAnimating = false
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
