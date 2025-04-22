//
//  GPXActivityAttributes.swift
//  conceptuelissime-swift
//
//  Created by Etienne Vautherin on 05/03/2025.
//

import Foundation
import ActivityKit
import Conceptuelissime


public struct GPXActivityAttributes: ActivityAttributes {
    public typealias ContentState = Location2D?
}

extension GPXActivityAttributes.ContentState: @retroactive UpdateConstructor {
    public var activityUpdate: (ActivityContent<Self>, AlertConfiguration?, Date?) {
        print("GPXActivityAttributes.ContentState.activityUpdate")
        return (activityContent, .none, self?.timestamp)
    }
}

