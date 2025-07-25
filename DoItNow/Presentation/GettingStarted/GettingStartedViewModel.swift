//
//  GettingStartedViewModel.swift
//  DoItNow
//
//  Created by Arnold Therigan on 25/07/25.
//

import SwiftUI

class GettingStartedViewModel: ObservableObject {
    @Published var currentIndex: Int = 0

    let slides: [SlideModel] = GETTING_STARTED_WORDING.sliders
}
