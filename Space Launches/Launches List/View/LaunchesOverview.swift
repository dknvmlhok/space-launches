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
    @State private var onSearchBarTap = false
    @State private var searchValue = ""

    // MARK: - View Body

    var body: some View {
        NavigationView {
            content
                .navigationBarTitle(Loca.launchesList.navigationBarTitle)
                .navigationBarItems(
                    leading: RefreshButtonView(viewModel: viewModel),
                    trailing: Button(Loca.launchesList.navigationBarItem) {
                        onSortButtonTap = true
                    }
                )
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(onSearchBarTap)
                .actionSheet(isPresented: $onSortButtonTap) {
                    ActionSheet(
                        title: Text(Loca.sort.title),
                        buttons: [
                            .default(Text(Loca.sort.sortByName)) {
                                viewModel.send(event: .onSelectSortType(.byName))
                            },
                            .default(Text(Loca.sort.sortByDate)) {
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
    }
}

// MARK: - Content Generating

private extension LaunchesOverview {

    func generateContent(with launches: [Launch]) -> some View {
        GeometryReader { geometry in
            ScrollView {

                if onSearchBarTap {
                    Spacer()
                }

                SearchBarView(
                    viewModel: viewModel,
                    searchValue: $searchValue.onChange {
                        viewModel.send(event: .onSearchBarEdit($0))
                    },
                    isEditing: $onSearchBarTap.onChange(),
                    viewHeight: geometry.size.height
                )
                .onTapGesture {
                    onSearchBarTap = true
                }

                if !onSearchBarTap {
                    LaunchesList(launches)
                        .padding(.horizontal)
                }
            }
       }
    }

    var content: some View {
        switch viewModel.overviewState {
        case .loading:
            return SpinnerView().eraseToAnyView()
        case .loaded(let launches):
            return generateContent(with: launches).eraseToAnyView()
        default:
            return Color.clear.eraseToAnyView()
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
