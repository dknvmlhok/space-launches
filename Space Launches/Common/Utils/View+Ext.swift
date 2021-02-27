//
//  View+Ext.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 21.02.2021.
//

import SwiftUI
import Kingfisher

extension View {

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func getCacheableImage(
        from url: URL?,
        of size: CGSize,
        placeholderImage: UIImage
    ) -> KFImage {
        KFImage(url)
            .placeholder {
                Image(uiImage: UIImage(named: "rocket")!)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(
                        width: size.width,
                        height: size.height,
                        alignment: .center
                    )
            }
            .downsampling(size: size)
            .retry(maxCount: 3, interval: .seconds(5))
            .cacheOriginalImage()
            .fade(duration: 0.25)
            .resizable()
    }
}
