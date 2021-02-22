//
//  SectionHeader.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 21.02.2021.
//

import SwiftUI

struct ListSectionHeader: View {

    // MARK: - Properties

    let text: String

    // MARK: - View Body

    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(.vertical)
        .background(Color(UIColor.systemBackground))
    }
}

// MARK: - Preview

#if DEBUG
struct ListSectionHeader_Previews: PreviewProvider {
    
    static var previews: some View {
        ListSectionHeader(text: "Section")
    }
}
#endif
