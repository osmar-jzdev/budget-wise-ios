//
//  Theme.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 16/01/23.
//

import SwiftUI

enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    case blueMain
    case blueStrong
    case redCustom
    case greenCustom
    case grayCustom
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow, .blueMain, .redCustom, .greenCustom, .grayCustom: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple, .blueStrong: return .white
        }
    }
    
    var mainColor: Color {
            Color(rawValue)
        }
}
