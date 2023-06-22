//
//  WCSessionManager.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 21/06/23.
//

import Foundation
import WatchConnectivity

class WCSessionManager: WCSession, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    func initSession() {
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
}
