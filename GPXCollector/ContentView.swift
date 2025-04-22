//
//  ContentView.swift
//  GPXCollector
//
//  Created by Etienne Vautherin on 16/04/2025.
//

import SwiftUI
import WidgetKit


struct ContentView: View {
    var body: some View {
        VStack {
            Button(intent: StartActivityIntent()) { Text("Start GPX Activity") }
                .padding()
            Button(intent: StopActivityIntent()) { Text("Stop started activity") }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
