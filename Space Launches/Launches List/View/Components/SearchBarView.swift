//
//  SearchBarView.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 18.02.2021.
//

import SwiftUI

struct SearchBarView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: LaunchesOverviewViewModel

    @Binding var searchValue: String
    @Binding var isEditing: Bool

    let viewSize: CGSize

    // MARK: - View Body

    var body: some View {
        VStack {
            HStack {
                TextField(Loca.search.placeholder, text: $searchValue)
                    .padding(7)
                    .padding(.horizontal, 22)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 6)

                            Spacer()

                            if !searchValue.isEmpty {
                                Button(
                                    action: {
                                        searchValue = ""
                                    },
                                    label: {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 6)
                                    }
                                )
                            }
                        }
                    )
                    .disableAutocorrection(true)

                if isEditing {
                    Button(Loca.general.cancel) {
                        isEditing = false
                        searchValue = ""

                        hideKeyboard()
                    }
                    .padding(.vertical, 10)
                }
            }
            .padding(.horizontal)

            if !searchValue.isEmpty {
                List(searchResults) { result in
                    LaunchesListRow(
                        launch: result,
                        imageSize: (
                            width: 50,
                            height: 50
                        )
                    )
                }
                .frame(
                    minHeight: viewSize.height,
                    maxHeight: .infinity,
                    alignment: .center
                )
            }
        }
    }
}

private extension SearchBarView {

    var searchResults: [Launch] {
        guard case .loaded(let results) = viewModel.searchState else {
            return .init()
        }
        return results
    }
}
// MARK: - Preview

#if DEBUGs
struct SearchBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchBarView(
            viewModel: LaunchesOverviewViewModel(),
            searchValue: Binding<String>.constant(""),
            isEditing: .constant(false),
            viewSize: .init(width: 200, height: 200)
        )
    }
}
#endif
