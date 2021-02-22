//
//  RefreshButtonView.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 21.02.2021.
//

import SwiftUI

struct RefreshButtonView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: LaunchesOverviewViewModel
    @State private var angle: Double = 0

    // MARK: - View Body
    
    var body: some View {
        Image(systemName: "arrow.clockwise")
            .foregroundColor(Color(.systemBlue))
            .onTapGesture {
                angle += 360
                viewModel.send(event: .onRefresh)
            }
            .rotationEffect(.degrees(angle))
            .animation(.linear)
    }
}

// MARK: - Preview

#if DEBUG
struct RefreshButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        RefreshButtonView(viewModel: LaunchesOverviewViewModel())
    }
}
#endif
