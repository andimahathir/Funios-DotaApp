//
//  SectionView.swift
//  Funios-DotaApp
//
//  Created by Caroline Chan on 19/11/22.
//

import SwiftUI

struct SectionView: View {
    let heroType: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Image(heroType)
                
                VStack (alignment: .leading) {
                    Text("\(heroType) Hero")
                        .font(.footnote.weight(.bold))
                    
                    Text(description)
                        .font(.caption2.weight(.light))
                }
                
                Spacer()
                
                Button() {
                    print("see all")
                } label: {
                    Text("See all")
                        .font(.footnote.weight(.bold))
                }
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(0..<10) {
                        Text("Hero \($0)")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 150, height: 172)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(heroType: "Strength", description: "Strength hero has advantages in many HP")
            .padding()
    }
}
