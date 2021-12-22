//
//  ButtonX.swift
//  Restart
//  Created by Yannick Fumukani on 12/20/21.
//

import SwiftUI

struct ButtonX: View {
    @State var text: String
    @State var bg: Color?
    @State var logo: String?
    
    var body: some View {
        
        ZStack {
            
            HStack {
                
                
                Image(systemName: logo ?? "questionmark.square.fill")
                    .foregroundColor(.white)
                    .imageScale(.medium)
                
                Text(text)
                    .font(.system(.body))
                    .foregroundColor(.white)
                
            }
            
        }
        .padding()
        .padding(.horizontal)
        .background(bg ?? Color("ColorBlue"))
        .cornerRadius(38)
        
        
    }
}

struct ButtonX_Previews: PreviewProvider {
    static var previews: some View {
        ButtonX(text: "Login with Face Id")
    }
}
