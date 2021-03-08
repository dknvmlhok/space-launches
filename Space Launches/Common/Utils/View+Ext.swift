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
    var eraseToAnyView: AnyView {
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
        placeholderImage: UIImage = UIImage(named: "rocket")!
    ) -> KFImage {
        KFImage(url)
            .placeholder {
                Image(uiImage: placeholderImage)
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
            .resizable()
    }
}
