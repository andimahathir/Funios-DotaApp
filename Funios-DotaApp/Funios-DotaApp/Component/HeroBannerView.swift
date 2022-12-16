//
//  HeroBanner.swift
//  Funios-DotaApp
//
//  Created by Ade Dwi Prayitno on 16/12/22.
//

import SwiftUI

struct HeroBannerView: View {
    @EnvironmentObject var detailHeroViewModel: DetailHeroViewModel
    var body: some View {
        AsyncImage(url: URL(string: detailHeroViewModel.getHeroImage())) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Color.gray
        }.frame(width: 390 ,height: 300)
            .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .top, endPoint: .bottom))
    }
}
