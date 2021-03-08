//
//  SearchNavigationView.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 18.02.2021.
//

import SwiftUI

// Native Search bar in SwiftUI inspired by https://medium.com/@yugantarjain/implement-native-search-bar-in-swiftui-664a6b944538

struct SearchNavigationView<Content: View> {
    @ObservedObject var viewModel: LaunchesOverviewViewModel
    @Binding var searchValue: String

    var content: () -> Content
}

// MARK: - Setup

extension SearchNavigationView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: context.coordinator.rootViewController)

        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.topItem?.searchController = context.coordinator.searchController

        context.coordinator.searchController.searchBar.delegate = context.coordinator

        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        context.coordinator.update(content: content())
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(
            viewModel: viewModel,
            content: content(),
            searchValue: $searchValue
        )
    }
}

// MARK: - Coordinator

extension SearchNavigationView {

    final class Coordinator: NSObject, UISearchBarDelegate {

        // MARK: - Properties

        @ObservedObject var viewModel: LaunchesOverviewViewModel
        @Binding var searchValue: String

        let rootViewController: UIHostingController<Content>
        let searchController: UISearchController

        // MARK: - Initialization

        init(
            viewModel: LaunchesOverviewViewModel,
            content: Content,
            searchValue: Binding<String>
        ) {
            self.viewModel = viewModel
            rootViewController = UIHostingController(rootView: content)
            searchController = UISearchController(searchResultsController: nil)
            _searchValue = searchValue

            searchController.searchBar.autocapitalizationType = .none
            searchController.obscuresBackgroundDuringPresentation = false

            rootViewController.navigationItem.searchController = searchController
        }

        // MARK: - User Interactions

        func update(content: Content) {
            rootViewController.rootView = content
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            viewModel.send(event: .onSearchBarEdit(searchText))

            if searchBar.text == "" {
                viewModel.send(event: .onSearchBarEndEditing)
            }
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            viewModel.send(event: .onSearchBarEdit(searchBar.text!))
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            viewModel.send(event: .onSearchBarEndEditing)
        }
    }
}
