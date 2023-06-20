//
//  HapticsManager.swift
//  Pilgrim
//
//  Created by Luiz Sena on 20/06/23.
//

import Foundation
import UIKit

class HapticManager {

    static let instance = HapticManager()
    let generator = UINotificationFeedbackGenerator()

    func successFeedback() {
        generator.notificationOccurred(.success)
    }

    func errorFeedback() {
        generator.notificationOccurred(.error)
    }
}
