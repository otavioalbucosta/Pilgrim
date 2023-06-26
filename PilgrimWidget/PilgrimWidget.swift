//
//  PilgrimWidget.swift
//  PilgrimWidget
//
//  Created by Luiz Sena on 26/06/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), leadboardData: ("Player", 0))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, leadboardData: ("Player", 0))
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let highScoreInteger = UserDefaults(suiteName: "group.highScoreUserDefault")?.integer(forKey: "highScore")

        let leaderboardData = ("Sua Pontuação", highScoreInteger ?? 0)

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 1 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration , leadboardData: leaderboardData)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let leadboardData: (String, Int)
}

struct PilgrimWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text("\(entry.leadboardData.0), \(entry.leadboardData.1)")
    }
}

struct PilgrimWidget: Widget {
    let kind: String = "PilgrimWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            PilgrimWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Pilgrim Widget")
        .description("Thats the PilgrimApp Widget")
    }
}

struct PilgrimWidget_Previews: PreviewProvider {
    static var previews: some View {
        PilgrimWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), leadboardData: ("Luiz", 10)))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
