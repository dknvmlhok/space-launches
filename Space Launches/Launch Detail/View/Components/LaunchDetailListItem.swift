//
//  LaunchDetailListItem.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 03/03/2021.
//

import SwiftUI

extension LaunchDetail.LaunchDetailItems {

    struct LaunchDetailListItem: View {

        enum ContentType {
            case text
            case link
        }

        // MARK: - Properties

        let sectionText: String
        let contentType: ContentType
        let contentItems: [(title: String?, value: Any)?]

        init(
            sectionText: String,
            contentType: ContentType = .text,
            contentItems: [(title: String?, value: Any)?]
        ) {
            self.sectionText = sectionText
            self.contentType = contentType
            self.contentItems = contentItems
        }

        // MARK: - View Content

        var body: some View {
            Section(header: sectionHeader) {
                content
            }
            .padding(.horizontal)
        }

        var sectionHeader: some View {
            Text(sectionText.uppercased())
                .font(.caption)
                .fontWeight(.regular)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }

        var content: some View {
            let mappedContentItems = contentItems
                .compactMap { $0 }
                .map { ($0.title, "\($0.value)") }

            return VStack(alignment: .leading, spacing: 20) {
                ForEach(mappedContentItems, id: \.self.0) { title, value in
                    switch contentType {
                    case .text:
                        VStack(alignment: .leading, spacing: 5) {
                            if let title = title {
                                Text(title)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .underline()
                            }

                            Text(value)
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                    case .link:
                        if let title = title, let url = URL(string: value) {
                            Link(title, destination: url)
                                .font(.body)
                            Divider()
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray5))
            .cornerRadius(10)
        }
    }
}

