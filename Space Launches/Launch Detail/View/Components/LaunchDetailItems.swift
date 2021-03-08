//
//  LaunchDetailItems.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 07/03/2021.
//

import SwiftUI

extension LaunchDetail {

    struct LaunchDetailItems: View {
        
        // MARK: - Properties
        
        let launch: Launch
        
        // MARK: - Initialization
        
        init(_ launch: Launch) {
            self.launch = launch
        }

        // MARK: - View Body

        var body: some View {
            let patchImage = getCacheableImage(
                from: launch.links.patch.small,
                of: CGSize(
                    width: CGFloat(200),
                    height: CGFloat(200)
                )
            )
            
            return LazyVStack(spacing: 20) {
                Group {
                    patchImage
                        .frame(
                            width: 200,
                            height: 200,
                            alignment: .center
                        )

                    LaunchDetailListItem(
                        sectionText: Loca.launchDetail.nameTitle,
                        contentItems: [
                            (
                                title: nil,
                                value: launch.name
                            )
                        ]
                    )
                    LaunchDetailListItem(
                        sectionText: Loca.launchDetail.flightNumberTitle,
                        contentItems: [
                            (
                                title: nil,
                                value: "\(launch.flightNumber)"
                            )
                        ]
                    )

                    LaunchDetailListItem(
                        sectionText: Loca.launchDetail.successTitle,
                        contentItems: [
                            (
                                title: nil,
                                value: "\(launch.success?.convertToConsentString ?? "")"
                            )
                        ]
                    )

                    LaunchDetailListItem(
                        sectionText: Loca.launchDetail.localLaunchDateTitle,
                        contentItems: [
                            (
                                title: Loca.dates.dateTitle,
                                value: DateFormatter.formateLocaleDate(with: .utc, from: launch.dateUTC)
                            ),
                            (
                                title: Loca.launchDetail.datePrecisionTitle,
                                value: launch.datePrecision.localized
                            )
                        ]
                    )

                    if launch.staticFireDateUTC != nil {
                        LaunchDetailListItem(
                            sectionText: Loca.launchDetail.staticFireDateTitle,
                            contentItems: [
                                (
                                    title: Loca.dates.dateTitle,
                                    value: DateFormatter.formateLocaleDate(with: .utc, from: launch.staticFireDateUTC!)
                                ),
                                (
                                    title: Loca.launchDetail.datePrecisionTitle,
                                    value: launch.datePrecision.localized
                                )
                            ]
                        )
                    }
                }
                Group {

                    if launch.details != nil {
                        LaunchDetailListItem(
                            sectionText: Loca.launchDetail.detailsTitle,
                            contentItems: [
                                (
                                    title: nil,
                                    value: "\(launch.details ?? "")"
                                )
                            ]
                        )
                    }

                    if launch.fairings != nil {
                        Fairings(for: launch)
                    }

                    Failures(for: launch)

                    LaunchDetailListItem(
                        sectionText: Loca.launchDetail.linksTitle,
                        contentType: .link,
                        contentItems: [
                            (
                                title: Loca.launchDetail.links.articleTitle,
                                value: "\(launch.links.article?.absoluteString ?? "")"
                            ),
                            (
                                title: Loca.launchDetail.links.wikipediaTitle,
                                value: "\(launch.links.wikipedia?.absoluteString ?? "")"
                            ),
                            (
                                title: Loca.launchDetail.links.webcastTitle,
                                value: "\(launch.links.webcast?.absoluteString ?? "")"
                            )
                        ]
                    )
                }
                
            }
        }
    }
}

// MARK: - View Components

private extension LaunchDetail.LaunchDetailItems {

    // MARK: - Fairings

    struct Fairings: View {
        let launch: Launch

        init(for launch: Launch) {
            self.launch = launch
        }

        var body: some View {
            let fairings = launch.fairings

            let recoveryAttempt = (title: Loca.launchDetail.fairings.recoveryAttemptTitle, value: fairings!.recoveryAttempt?.convertToConsentString ?? Loca.general.no)
            let recovered = (title: Loca.launchDetail.fairings.recoveredTitle, value: fairings!.recovered?.convertToConsentString ?? Loca.general.no)
            let reused = (title: Loca.launchDetail.fairings.reusedTitle, value: fairings!.reused?.convertToConsentString ?? Loca.general.no)

            return LaunchDetailListItem(
                sectionText: Loca.launchDetail.fairingsTitle,
                contentItems: [
                    recoveryAttempt,
                    recovered,
                    reused
                ]
            )
        }
    }

    // MARK: - Failures

    struct Failures: View {
        let launch: Launch

        init(for launch: Launch) {
            self.launch = launch
        }

        var body: some View {
            let failures = launch.failures

            ForEach(failures, id: \.self) { failure -> LaunchDetailListItem in
                let time = (title: Loca.launchDetail.failures.timeTitle, value: DateFormatter.formateTime(from: failure.time))
                let altitude = failure.altitude != nil ? (title: Loca.launchDetail.failures.altitudeTitle, value: failure.altitude!) : nil
                let reason = (title: Loca.launchDetail.failures.reasonTitle, value: failure.reason.capitalized)

                return LaunchDetailListItem(
                    sectionText: Loca.launchDetail.failuresTitle,
                    contentItems: [
                        time,
                        altitude,
                        reason
                    ]
                )
            }
        }
    }
}
