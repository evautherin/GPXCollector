//
//  GPXLiveActivityLiveActivity.swift
//  GPXLiveActivity
//
//  Created by Etienne Vautherin on 18/04/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GPXLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GPXActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("GPX \("📍")")
                Button(intent: StopActivityIntent(activityID: context.activityID)) { Text("Stop") }
            }.padding()

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("GPX \("📍")")
                    // more content
                    Button(intent: StopActivityIntent(activityID: context.activityID)) { Text("Stop") }
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \("📍")")
            } minimal: {
                Text("📍")
            }
        }
    }
}
