//
//  Location2D.swift
//  conceptuelissime-swift
//
//  Created by Etienne Vautherin on 26/03/2025.
//

import CoreLocation
import Conceptuelissime


public struct Location2D: Sendable, Codable, Hashable {
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let timestamp: Date
}

extension Location2D: ActivityContentState { }

extension Location2D: ActivityLiveState {
    public static func liveUpdates() -> any SendableAsyncSequence {
        print("Location2D liveUpdates")
        return AlwaysLocationUpdate.liveUpdates()
            .compactMap(\.location?.location2D)
//            .map {
//                print("location2D: \($0)")
//                return $0
//            }
    }
}

public extension CLLocation {
    var location2D: Location2D {
        Location2D(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude,
            timestamp: timestamp
        )
    }
}
