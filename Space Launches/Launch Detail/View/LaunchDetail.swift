//
//  LaunchDetail.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 27/02/2021.
//

import SwiftUI

struct LaunchDetail: View {

    // MARK: - Properties

    @ObservedObject var viewModel: LaunchDetailViewModel

    // MARK: - View Body

    var body: some View {
        content
            .navigationBarItems(trailing: RefreshButtonView(viewModel: viewModel))
            .onAppear {
                viewModel.send(event: .onAppear)
            }
            .alert(isPresented: alertBinding.0) {
                let message = alertBinding.1.wrappedValue?.localizedDescription ?? Loca.errors.unknownError

                return Alert(
                    title: Text(Loca.errors.networkError),
                    message: Text("\(Loca.errors.launchDetailLoadingError) \(message)."),
                    dismissButton: .cancel(Text(Loca.general.ok))
                )

            }
    }
}

// MARK: - Content Generating

private extension LaunchDetail {

    func generateContent(with launch: Launch) -> some View {
        ScrollView {
            LaunchDetailItems(launch)
                .padding(.top)
        }
    }

    var content: some View {
        switch viewModel.detailState {
        case .loading:
            return SpinnerView().eraseToAnyView
        case .loaded(let launch):
            return generateContent(with: launch)
            .eraseToAnyView
        default:
            return Color.clear.eraseToAnyView
        }
    }
}

// MARK: - Bindings

private extension LaunchDetail {

    var alertBinding: Binding<(receivedError: Bool, error: NetworkError?)> {
        guard case .error(let error) = viewModel.detailState else {
            return Binding.constant((receivedError: false, error: nil))
        }

        return Binding.constant((receivedError: true, error: error))
    }
}

// MARK: - Preview

#if DEBUG
struct LaunchDetail_Previews: PreviewProvider {

    static var previews: some View {
        LaunchDetail(viewModel: LaunchDetailViewModel(launchId: Launch.mock.id))
    }
}
#endif
