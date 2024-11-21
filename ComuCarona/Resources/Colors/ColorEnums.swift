//
//  ColorEnums.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 20/11/24.
//

import SwiftUI

// MARK: - Enum for Feedback Colors
enum FeedbackColor: String {
    case success
    case error
    case warning
    
    var color: Color {
        return Color(self.rawValue)
    }
}

// MARK: - Enum for Theme Colors
enum ThemeColor: String {
    case primary
    case secondary
    
    var color: Color {
        return Color(self.rawValue)
    }
}

// MARK: - Enum for Basic Colors
enum BasicColor: String {
    case black
    case white
    
    var color: Color {
        return Color(self.rawValue)
    }
}

// MARK: - Enum for Background Colors
enum BackgroundColor: String {
    case disabledBackground
    case skeletonBackground
    
    var color: Color {
        return Color(self.rawValue)
    }
}
