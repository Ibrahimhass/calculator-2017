//
//  View+Helper.swift
//  Calculator-SwiftUI
//
//  Created by Swiftify on 04/01/22.
//

import SwiftUI

// --------------------------------------------------------------------------------
// Dynamic Size Helper
// --------------------------------------------------------------------------------
struct DynamicSize {
    static private let baseViewWidth: CGFloat = 667.0
    static private let baseViewHeight: CGFloat = 375.0

    static func getHeight(_ height: CGFloat) -> CGFloat {
        return (height / baseViewHeight) * UIScreen.main.bounds.height
    }

    static func getWidth(_ width: CGFloat) -> CGFloat {
        return (width / baseViewWidth) * UIScreen.main.bounds.width
    }

    static func getOffsetX(_ x: CGFloat) -> CGFloat {
        return (x / baseViewWidth) * UIScreen.main.bounds.width
    }

    static func getOffsetY(_ y: CGFloat) -> CGFloat {
        return (y / baseViewHeight) * UIScreen.main.bounds.height
    }
}

// --------------------------------------------------------------------------------
// Frame and Offset Helper
// --------------------------------------------------------------------------------
extension View {
    func frame(dynamicWidth: CGFloat? = nil, dynamicHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        self.frame(width: DynamicSize.getWidth(dynamicWidth ?? 0), height: DynamicSize.getHeight(dynamicHeight ?? 0), alignment: alignment)
    }

    func offset(dynamicX: CGFloat = 0, dynamicY: CGFloat = 0) -> some View {
        self.offset(x: DynamicSize.getOffsetX(dynamicX), y: DynamicSize.getOffsetY(dynamicY))
    }
}
