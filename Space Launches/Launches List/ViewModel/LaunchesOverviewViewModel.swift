//
//  LaunchesOverviewViewModel.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 11.02.2021.
//

import Foundation
import Combine
import Resolver

final class LaunchesOverviewViewModel: ObservableObject {

    typealias OverviewState = LaunchesOverviewFeedback.OverviewState
    typealias SearchState = LaunchesOverviewFeedback.SearchState
    typealias Event = LaunchesOverviewFeedback.Event
    typealias SortType = LaunchesOverviewFeedback.SortType

    // MARK: - Properties

    @Injected var dataProvider: PastLaunchesDataProviderType
    @Published var overviewState = OverviewState.idle
    @Published var searchState = SearchState .idle

    private var event = PassthroughSubject<Event, Never>()
    private var cancellables = Set<AnyCancellable>()

    private var loadedLaunches = [Launch]()

    // MARK: - Initialization

    init() {
        handleEvents()
    }

    // MARK: - Methods

    func send(event: Event) {
        self.event.send(event)
    }
}

// MARK: - Events Handling

private extension LaunchesOverviewViewModel {

    func handleEvents() {
        event
            .sink { [weak self] event in
                guard let self = self else { return }

                switch event {
                case .onAppear:
                    self.loadData()
                case .onSelectSortType(let type):
                    self.sortList(by: type)
                case .onSearchBarEdit(let text):
                    self.searchResults(by: text)
                case .onRefresh:
                    self.loadData()
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Data Processing

private extension LaunchesOverviewViewModel {

    func loadData() {
        overviewState = .loading

        dataProvider.getPastLaunches
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard case .failure(let error) = completion else { return }
                    self?.overviewState = .error(error)
                },
                receiveValue: { [weak self] launches in
                    self?.overviewState = .loaded(launches)
                    self?.loadedLaunches = launches
                }
            )
            .store(in: &cancellables)
    }

    func sortList(by type: SortType) {
        var launches = loadedLaunches

        switch type {
        case .byName:
            launches.sort { $0.name < $1.name }
            overviewState = .loaded(launches)
        case .byDate:
            launches.sort {
                    let formattedDateA = DateFormatter.formateStringToDate(from: $0.dateLocal)
                    let formattedDateB = DateFormatter.formateStringToDate(from: $1.dateLocal)

                    return formattedDateA.compare(formattedDateB) == .orderedDescending
                }

            overviewState = .loaded(launches)
        }
    }

    func searchResults(by text: String) {
        let launches = loadedLaunches

        let results = launches.filter {
            let date = DateFormatter.formateLocaleDate(from: $0.dateLocal)

            let filteredByNameOrDate =
                $0.name.range(of: text, options: .caseInsensitive) != nil ||
                date.range(of: text, options: .caseInsensitive) != nil

            return filteredByNameOrDate
        }

        searchState = .loaded(results)
    }
}
