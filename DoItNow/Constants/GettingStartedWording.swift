//
//  GettingStartedWording.swift
//  DoItNow
//
//  Created by Arnold Therigan on 25/07/25.
//

import SwiftUI

enum GETTING_STARTED_WORDING {
    static let sliders: [SlideModel] = [
        SlideModel(imageName: "gs-slide-1",
                   title: "Easy Time Management",
                   description: "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first"),
        SlideModel(imageName: "gs-slide-2",
                   title: "Increase Work Effectiveness",
                   description: "Time management and the determination of more important tasks will give your job statistics better and always improve"),
        SlideModel(imageName: "gs-slide-3",
                   title: "Reminder Notification",
                   description: "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set")
    ]
    static let skipLabel = "Skip"
    static let getStartedLabel = "Get Started"
}
