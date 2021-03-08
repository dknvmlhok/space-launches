//
//  LaunchesOverview.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 11.02.2021.
//

import SwiftUI

struct LaunchesOverview: View {

    // MARK: - Properties

    @ObservedObject var viewModel: LaunchesOverviewViewModel

    @State private var onSortButtonTap = false
    @State private var searchValue = ""
    @State private var launches = [Launch]()

    // MARK: - View Body

    var body: some View {
        SearchNavigationView(
            viewModel: viewModel,
            searchValue: $searchValue
        ) {
            listContent
                .navigationBarTitle(Loca.launchesList.navigationBarTitle)
                .navigationBarItems(
                    leading: RefreshButtonView(viewModel: viewModel),
                    trailing: Button(Loca.launchesList.navigationBarItem) {
                        onSortButtonTap = true
                    }
                )
                .navigationViewStyle(StackNavigationViewStyle())
                .actionSheet(isPresented: $onSortButtonTap) {
                    ActionSheet(
                        title: Text(Loca.launchesList.sort.title),
                        buttons: [
                            .default(Text(Loca.launchesList.sort.sortByName)) {
                                viewModel.send(event: .onSelectSortType(.byName))
                            },
                            .default(Text(Loca.launchesList.sort.sortByDate)) {
                                viewModel.send(event: .onSelectSortType(.byDate))
                            },
                            .cancel()
                        ]
                    )
                }
                .onAppear {
                    viewModel.send(event: .onAppear)
                }
                .alert(isPresented: alertBinding.0) {
                    let message = alertBinding.1.wrappedValue?.localizedDescription ?? Loca.errors.unknownError

                    return Alert(
                        title: Text(Loca.errors.networkError),
                        message: Text("\(Loca.errors.launchesListLoadingError) \(message)."),
                        dismissButton: .cancel(Text(Loca.general.ok))
                    )
                }

        }
        .gesture(DragGesture().onChanged { _ in hideKeyboard() }) // Hides keyboard on scroll
        .ignoresSafeArea()
    }
}

// MARK: - Content Generating

private extension LaunchesOverview {

    func generateListContent(with launches: [Launch]) -> some View {
        ScrollView {
            LaunchesListView(launches)
                .padding(.horizontal)
        }
        .transition(.move(edge: .top))
        .animation(.linear(duration: 0.2))
    }

    var listContent: some View {
        switch viewModel.overviewState {
        case .loading:
            return SpinnerView().eraseToAnyView
        case .loaded(let launches):
            return generateListContent(with: launches).eraseToAnyView
        default:
            return Color.clear.eraseToAnyView
        }
    }
}

// MARK: - Bindings

private extension LaunchesOverview {

    var alertBinding: Binding<(receivedError: Bool, error: NetworkError?)> {
        guard case .error(let error) = viewModel.overviewState else {
            return Binding.constant((receivedError: false, error: nil))
        }

        return Binding.constant((receivedError: true, error: error))
    }
}

// MARK: - Preview

#if DEBUG
struct LaunchesOverview_Previews: PreviewProvider {

    static var previews: some View {
        LaunchesOverview(viewModel: LaunchesOverviewViewModel())
    }
}
#endif
