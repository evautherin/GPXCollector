//
//  ActivityIntents.swift
//  conceptuelissime-swift
//
//  Created by Etienne Vautherin on 18/04/2025.
//

import AppIntents
import ActivityKit
import Conceptuelissime

#if targetEnvironment(simulator)
import SwiftLocation
#endif


struct StartActivityIntent: LiveActivityIntent {
    static let title: LocalizedStringResource = "Start new GPX activity"
    static let description = IntentDescription("Start a new Live Activity.")

    func perform() async throws -> some IntentResult {
        print("StartActivityIntent")
        #if targetEnvironment(simulator)
        try await Location().requestPermission(.always)
        #endif

        Task {
            do {
                try await ActivityLifeCycle.proceed(GPXActivityAttributes())
                print("ActivityLifeCycle proceed finished")
            } catch {
                print(error.localizedDescription)
            }
        }
        return .result()
    }
}

struct StopActivityIntent: LiveActivityIntent {
    static let title: LocalizedStringResource = "Stop a GPX activity"
    static let description = IntentDescription("Stop the Live Activity with activityID identifier. When activityID is not provided, stop the first GPX activity.")

    let activityID: String?
    
    init() {
        self.activityID = .none
    }
    
    init(activityID: String) {
        self.activityID = activityID
    }
    
    func perform() async throws -> some IntentResult {
        print("StopActivityIntent")
        let activities = Activity<GPXActivityAttributes>.activities
        let activity = switch (activityID) {
        case .none: activities.first
        case .some(let activityID): activities.first { activity in activity.id == activityID }
        }
        print("Activity to stop: \(activity.debugDescription)")
        await activity?.end(.none, dismissalPolicy: .immediate)
        return .result()
    }
}
