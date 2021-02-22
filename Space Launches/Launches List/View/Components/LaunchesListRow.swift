//
//  LaunchesListRow.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 14.02.2021.
//

import SwiftUI

struct LaunchesListRow: View {
    
    // MARK: - Properties

    let launch: Launch
    let imageSize: (width: CGFloat, height: CGFloat)

    // MARK: - View Body

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "photo")
                .resizable()
                .frame(
                    width: imageSize.width,
                    height: imageSize.height,
                    alignment: .center
                )
                .padding(.trailing)
            HStack {
                VStack(alignment: .leading) {
                    Text(launch.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                    Text(DateFormatter.formateLocaleDate(from: launch.dateLocal))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

// MARK: - Preview

#if DEBUG
struct LaunchesListRow_Previews: PreviewProvider {
    
    static var previews: some View {
        LaunchesListRow(
            launch: Launch.mock,
            imageSize: (
                width: 100,
                height: 100
            )
        )
    }
}
#endif
