//
//  DetailHeroView.swift
//  Funios-DotaApp
//
//  Created by Ade Dwi Prayitno on 08/12/22.
//

import SwiftUI

struct DetailHeroView: View {
    var dota: DotaHeroStats
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")
            VStack {
                AsyncImage(url: URL(string: "https://api.opendota.com\(dota.img)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray
                }.frame(height: 220)
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .top, endPoint: .bottom))
            }
            
        }.ignoresSafeArea()
    }
}

struct DetailHeroView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeroView(dota: DotaHeroStatsDummy)
    }
}
