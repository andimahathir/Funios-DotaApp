//
//  GuideOfHeroView.swift
//  Funios-DotaApp
//
//  Created by Caroline Chan on 19/11/22.
//

import SwiftUI

struct GuideOfHeroView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://images2.alphacoders.com/505/505544.jpg")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(width: .infinity, height: 185)
            .cornerRadius(10)
            
            VStack {
                Text("GUIDE OF \nHERO")
                .font(.title.weight(.medium))
                .foregroundColor(.white)
                
                Text("Learn your hero here")
                    .font(.footnote.weight(.regular))
                    .foregroundColor(.white)
                    .padding(.top, 0)
            }
            .padding(.leading)
        }
    }
}

struct GuideOfHeroView_Previews: PreviewProvider {
    static var previews: some View {
        GuideOfHeroView()
    }
}
