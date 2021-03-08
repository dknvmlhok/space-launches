//
//  LaunchesListView.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 22.02.2021.
//

import SwiftUI

extension LaunchesOverview {

    struct LaunchesListView: View {

        // MARK: - Properties

        let launches: [Launch]

        // MARK: - Initialization

        init(_ launches: [Launch]) {
            self.launches = launches
        }

        // MARK: - View Body

        var body: some View {
            LazyVStack {
                Section(header: LaunchesListSectionHeader(text: Loca.launchesList.LaunchesListSectionHeader.uppercased())) {
                    ForEach(launches, id: \.id) { launch in
                        LaunchesListRow(
                            launch: launch,
                            imageSize: (
                                width: 100,
                                height: 100
                            )
                        )
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    }
                }
            }
            .animation(nil)
        }
    }
}

// MARK: - Preview

#if DEBUG
struct LaunchesList_Previews: PreviewProvider {

    static var previews: some View {
        LaunchesOverview.LaunchesListView([Launch.mock])
    }
}
#endif
