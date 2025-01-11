import SwiftUI
// Icon Size Enum
enum IconSize {
    case small
    case medium
    case large
    case extraLarge
    var size: CGFloat {
        switch self {
        case .small:
            return 16
        case .medium:
            return 24
        case .large:
            return 32
        case .extraLarge:
            return 48
        }
    }
}
/*
// Icon Color Enum (Only Black or White)
enum IconColor {
    case black
    case white
    var color: Color {
        switch self {
        case .black:
            return AppColors.warningColor
        case .white:
            return .white
        }
    }
}

 */
