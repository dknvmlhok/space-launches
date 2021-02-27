//
//  SpinnerView.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 21.02.2021.
//

import Foundation
import SwiftUI

struct SpinnerView: View {

    var body: some View {
        VStack(alignment: .center) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            Text(Loca.general.loading)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.top, 5.0)

        }
    }
}

// MARK: - Preview

#if DEBUG
struct SpinnerView_Previews: PreviewProvider {

    static var previews: some View {
        SpinnerView()
    }
}
#endif
