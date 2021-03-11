//
//  PlaceholderPoster.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 08/03/2021.
//

import SwiftUI

struct PlaceholderPoster: View {
    var body: some View {
        Image(systemName: "film")
            .frame(width: 92, height: 138, alignment: .center)
            .foregroundColor(Color(.lightGray))
            .background(Color(.tertiarySystemFill))
    }
}
