import SwiftUI

enum IconSize {
    case verySmall
    case slightlySmall
    case small
    case slightlyNormal
    case normal
    case slightlyLarge
    case large
    case veryLarge
    case extraLarge
    case high

    var size: CGFloat {
        switch self {
        case .verySmall:
            return UISizerHelper.IconSize.verySmall
        case .slightlySmall:
            return UISizerHelper.IconSize.slightlySmall
        case .small:
            return UISizerHelper.IconSize.small
        case .slightlyNormal:
            return UISizerHelper.IconSize.slightlyNormal
        case .normal:
            return UISizerHelper.IconSize.normal
        case .slightlyLarge:
            return UISizerHelper.IconSize.slightlyLarge
        case .large:
            return UISizerHelper.IconSize.large
        case .veryLarge:
            return UISizerHelper.IconSize.veryLarge
        case .extraLarge:
            return UISizerHelper.IconSize.extraLarge
        case .high:
            return UISizerHelper.IconSize.high
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
