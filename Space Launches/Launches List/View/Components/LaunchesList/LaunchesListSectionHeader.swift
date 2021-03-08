//
//  LaunchesLaunchesListSectionHeader.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 21.02.2021.
//

import SwiftUI

extension LaunchesOverview.LaunchesListView {
    
    struct LaunchesListSectionHeader: View {

        // MARK: - Properties

        let text: String

        // MARK: - View Body

        var body: some View {
            HStack {
                Text(text)
                    .font(.caption)
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
            }
            .padding(.top)
            .padding(.bottom, 5)
        }
    }

    // MARK: - Preview

    #if DEBUG
    struct LaunchesListSectionHeader_Previews: PreviewProvider {

        static var previews: some View {
            LaunchesListSectionHeader(text: "Section")
        }
    }
    #endif
}

