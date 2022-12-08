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
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }.frame(width: 385 ,height: 300)
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .top, endPoint: .bottom))
                HStack(spacing: 10) {
                    Text(dota.localizedName)
                        .font(Font.custom("Proxima Nova Bold", size: 40))
                        .foregroundColor(.white)
                    Image(dota.primaryAttr == "agi" ? "Agility" : "")
                    Spacer()
                }
            }
            
        }.ignoresSafeArea()
    }
}

struct DetailHeroView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeroView(dota: DotaHeroStatsDummy)
    }
}
