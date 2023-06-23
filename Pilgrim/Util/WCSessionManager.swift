//
//  WCSessionManager.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 21/06/23.
//

import Foundation
import WatchConnectivity

struct NotificationMessage: Identifiable {
    let id = UUID()
    let text: String
}

final class WCSessionManager: NSObject, ObservableObject {

    static let shared = WCSessionManager()
    @Published var cards: [LocalElement] = []

    private override init() {
        super.init()

        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }

    func updateWatchData(cards: [LocalElement]) {
        let cardsData = JSONWrite.encodeObject(cards)
        let context = ["cards": cardsData]
        guard WCSession.default.activationState == .activated else {
            return
        }
        #if os(iOS)
        guard WCSession.default.isWatchAppInstalled else {
            return
        }
        #else
        guard WCSession.default.isCompanionAppInstalled else {
            return
        }
        #endif
        do {
            try WCSession.default.updateApplicationContext(context)
        } catch {
            print(error)
        }
    }
}

extension WCSessionManager: WCSessionDelegate {

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        if let cards = applicationContext["cards"] as? Data {
            do {
                let decodedData = try JSONDecoder().decode([LocalElement].self, from: cards)
                DispatchQueue.main.async { [weak self] in
                    self?.cards = decodedData
                }
            } catch {
                print(error)
            }
        }
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}

    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {}

    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    #endif
}


