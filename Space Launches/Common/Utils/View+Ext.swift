//
//  View+Ext.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 21.02.2021.
//

import SwiftUI
import Kingfisher

extension View {

    /// Converts View to AnyView
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

    /// Hides system keyboard
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    /// Fetches Image from URL and caches appropriately
    ///
    /// - Parameters:
    ///   - url: URL to fetch image from
    ///   - size: Preferred Image CGSize
    ///   - placeholderImage: Placeholder image to set before data from URL is loaded
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
