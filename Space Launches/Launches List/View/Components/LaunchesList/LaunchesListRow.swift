//
//  LaunchesListRow.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 14.02.2021.
//

import SwiftUI

extension LaunchesOverview.LaunchesListView {

    struct LaunchesListRow: View {
        
        // MARK: - Properties
        
        let launch: Launch
        let imageSize: (width: CGFloat, height: CGFloat)
        
        // MARK: - View Body
        
        var body: some View {
            let launchImage = getCacheableImage(
                from: launch.links.patch.small,
                of: CGSize(
                    width: imageSize.width,
                    height: imageSize.height
                )
            )
            
            let launchDetailViewModel = LaunchDetailViewModel(launchId: launch.id)
            let launchDetail = LaunchDetail(viewModel: launchDetailViewModel)

            NavigationLink(
                destination: launchDetail.navigationBarTitle(launch.name, displayMode: .inline)
            ) {
                HStack(alignment: .center) {
                    launchImage
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
                                .font(.body)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .foregroundColor(.primary)
                        }
                    }
                    Spacer()
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
}
