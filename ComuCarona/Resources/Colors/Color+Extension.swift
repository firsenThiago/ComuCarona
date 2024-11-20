//
//  Color+Extension.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 20/11/24.
//

import SwiftUI


// MARK: - Extension for easy usage
extension Color {
    static func theme(_ themeColor: ThemeColor) -> Color {
        return themeColor.color
    }
    
    static func basic(_ basicColor: BasicColor) -> Color {
        return basicColor.color
    }
    
    static func background(_ backgroundColor: BackgroundColor) -> Color {
        return backgroundColor.color
    }
    
    static func feedback(_ feedbackColor: FeedbackColor) -> Color {
        return feedbackColor.color
    }
}
