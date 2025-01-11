import SwiftUI

enum ButtonType {
    case normal, text, icon

    var textColor: Color {
        switch self {
        case .normal: return .white
        case .text: return .black
        case .icon: return .black
        }
    }

    var backgroundColor: Color {
        switch self {
        case .normal: return .black
        case .text: return .clear
        case .icon: return .gray
        }
    }

    var iconSize: CGFloat {
        switch self {
        case .icon: return 60
        default: return 0
        }
    }
}

enum ButtonSize {
    case extraSmall, small, medium, large

    var fontSize: CGFloat {
        switch self {
        case .extraSmall: return 10
        case .small: return 12
        case .medium: return 14
        case .large: return 16
        }
    }

    var padding: EdgeInsets {
        switch self {
        case .extraSmall: return EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
        case .small: return EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .medium: return EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
        case .large: return EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24)
        }
    }
}
