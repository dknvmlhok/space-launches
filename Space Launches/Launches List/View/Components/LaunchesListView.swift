//
//  LaunchesListView.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 22.02.2021.
//

import SwiftUI

extension LaunchesOverview {

    struct LaunchesList: View {

        // MARK: - Properties

        let launches: [Launch]

        // MARK: - Initialization

        init(_ launches: [Launch]) {
            self.launches = launches
        }

        // MARK: - View Body

        var body: some View {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section(header: ListSectionHeader(text: Loca.launchesList.listSectionHeader)) {
                    ForEach(launches, id: \.id) {
                        LaunchesListRow(
                            launch: $0,
                            imageSize: (
                                width: 100,
                                height: 100
                            )
                        )
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(25)
                    }
                }
            }
        }
    }
}

// MARK: - Preview

#if DEBUG
struct LaunchesList_Previews: PreviewProvider {

    static var previews: some View {
        LaunchesOverview.LaunchesList([Launch.mock])
    }
}
#endif
