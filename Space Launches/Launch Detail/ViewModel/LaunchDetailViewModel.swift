//
//  LaunchDetailViewModel.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 01/03/2021.
//

import Foundation
import Combine
import Resolver

final class LaunchDetailViewModel: ObservableObject {

    // MARK: - TypeAliases

    typealias DetailState = UIFeedbacks.DetailState
    typealias Event = UIFeedbacks.Event

    // MARK: - Properties

    @Injected var dataProvider: PastLaunchDetailDataProviderType
    @Published var detailState = DetailState.idle

    let launchId: LaunchId

    private var event = PassthroughSubject<Event, Never>()
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization

    init(launchId: LaunchId) {
        self.launchId = launchId

        handleEvents()
    }
}

// MARK: - ViewModelType

extension LaunchDetailViewModel: ViewModelType {

    func send(event: Event) {
        self.event.send(event)
    }
}

// MARK: - Event Handling

private extension LaunchDetailViewModel {

    func handleEvents() {
        event
            .sink { [weak self] event in
                guard let self = self else { return }

                switch event {
                case .onAppear:
                    self.loadData(with: self.launchId)
                case .onRefresh:
                    self.loadData(with: self.launchId)
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Data Processing

private extension LaunchDetailViewModel {

    func loadData(with launchId: LaunchId) {
        detailState = .loading

        dataProvider.getPastLaunchDetail(with: launchId)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard case .failure(let error) = completion else { return }
                    self?.detailState = .error(error)
                },
                receiveValue: { [weak self] in
                    self?.detailState = .loaded($0)
                }
            )
            .store(in: &cancellables)
    }
}
