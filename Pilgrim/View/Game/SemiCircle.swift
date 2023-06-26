//
//  SemiCircle.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import Foundation
import SwiftUI

struct SemiCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.02635*width, y: 0.99708*height))
        path.addCurve(to: CGPoint(x: 0.68781*width, y: 0.85106*height), control1: CGPoint(x: 0.27444*width, y: 0.99708*height), control2: CGPoint(x: 0.51238*width, y: 0.94455*height))
        path.addCurve(to: CGPoint(x: 0.96179*width, y: 0.49854*height), control1: CGPoint(x: 0.86324*width, y: 0.75757*height), control2: CGPoint(x: 0.96179*width, y: 0.63076*height))
        path.addCurve(to: CGPoint(x: 0.68781*width, y: 0.14602*height), control1: CGPoint(x: 0.96179*width, y: 0.36632*height), control2: CGPoint(x: 0.86324*width, y: 0.23951*height))
        path.addCurve(to: CGPoint(x: 0.02635*width, y: 0), control1: CGPoint(x: 0.51238*width, y: 0.05252*height), control2: CGPoint(x: 0.27445*width, y: 0))
        path.addLine(to: CGPoint(x: 0.02635*width, y: 0.49854*height))
        path.addLine(to: CGPoint(x: 0.02635*width, y: 0.99708*height))
        path.closeSubpath()
        return path
    }
}
