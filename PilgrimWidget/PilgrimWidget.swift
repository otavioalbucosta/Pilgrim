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
        GeometryReader { geo in
            VStack {
                Spacer()
                Text("\(entry.leadboardData.0): \(entry.leadboardData.1)")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(Color("textColor"))
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.shadow(.inner(color: .gray, radius: 2, x: 0, y: 2)))
                            .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.20)

                    }
                    .padding(.top, 25)

                Image("trophy")
                    .resizable()
                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
                    Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color("WidgetBackground"))
        }
    }
}

struct PilgrimWidget: Widget {
    let kind: String = "PilgrimWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            PilgrimWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Pilgrim Widget")
        .description("Display your HighScore")
        .supportedFamilies([.systemSmall])
    }
}

struct PilgrimWidget_Previews: PreviewProvider {
    static var previews: some View {
        PilgrimWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), leadboardData: ("Luiz", 10)))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
