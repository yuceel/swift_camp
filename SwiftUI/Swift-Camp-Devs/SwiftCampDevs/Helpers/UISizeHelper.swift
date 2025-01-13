import SwiftUI
 
struct UISizerHelper {
    // MARK: - Screen Size
    struct Screen {
        static var width: CGFloat {
            UIScreen.main.bounds.width
        }
        static var height: CGFloat {
            UIScreen.main.bounds.height
        }
        static func dynamicWidth(_ value: CGFloat) -> CGFloat {
            width * value
        }
        static func dynamicHeight(_ value: CGFloat) -> CGFloat {
            height * value
        }
    }
    // MARK: - Dimensions
    struct Dimensions {
        static let low: CGFloat = Screen.height * 0.01
        static let normal: CGFloat = Screen.height * 0.02
        static let medium: CGFloat = Screen.height * 0.04
        static let high: CGFloat = Screen.height * 0.1
    }
    // MARK: - Radius
    struct Radius {
        static let none: CGFloat = 0
        static let low: CGFloat = 2
        static let normal: CGFloat = 13
        static let medium: CGFloat = 30
        static let high: CGFloat = 100
    }
    // MARK: - Font Sizes
    struct FontSize {
        static let small: CGFloat = 12
        static let medium: CGFloat = 16
        static let normal: CGFloat = 20
        static let large: CGFloat = 24
        static let extraLarge: CGFloat = 32
    }
    
    // MARK: - Button Font Sizes
    struct ButtonSize {
        static let small: CGFloat = 12
        static let medium: CGFloat = 14
        static let normal: CGFloat = 16
    }
    // MARK: - Padding
    struct Padding {
        static let low = EdgeInsets(top: Dimensions.low, leading: Dimensions.low, bottom: Dimensions.low, trailing: Dimensions.low)
        static let normal = EdgeInsets(top: Dimensions.normal, leading: Dimensions.normal, bottom: Dimensions.normal, trailing: Dimensions.normal)
        static let medium = EdgeInsets(top: Dimensions.medium, leading: Dimensions.medium, bottom: Dimensions.medium, trailing: Dimensions.medium)
        static let high = EdgeInsets(top: Dimensions.high, leading: Dimensions.high, bottom: Dimensions.high, trailing: Dimensions.high)
    }
    // MARK: - Divider
    struct DividerStyle {
        static func customDivider(color: Color = .gray, thickness: CGFloat = 1) -> some View {
            Divider()
                .background(color)
                .frame(height: thickness)
        }
    }
    // MARK: - Empty Views (Spacing)
    struct EmptyViews {
        static func spacer(height: CGFloat? = nil, width: CGFloat? = nil) -> some View {
            Spacer()
                .frame(width: width, height: height)
        }
    }
    // MARK: - Duration
    struct Time {
        static func seconds(_ value: Int) -> TimeInterval {
            TimeInterval(value)
        }
        static func minutes(_ value: Int) -> TimeInterval {
            TimeInterval(value * 60)
        }
        static func hours(_ value: Int) -> TimeInterval {
            TimeInterval(value * 3600)
        }
        static func days(_ value: Int) -> TimeInterval {
            TimeInterval(value * 86400)
        }
    }
    // MARK: - Icon Sizes
    struct IconSize {
        static let extraSmall: CGFloat = 14
        static let small: CGFloat = 20
        static let normal: CGFloat = 25
        static let medium: CGFloat = 30
        static let large: CGFloat = 40
        static let high: CGFloat = 50
        static let extraHigh: CGFloat = 60
    }
    // MARK: - Text Line
    struct TextLine {
        static let enterLine = "\n"
    }
    // MARK: - Image Asset
    struct ImageLoader {
        static func loadImage(named: String, widthRatio: CGFloat = 0.1) -> some View {
            Image(named)
                .resizable()
                .scaledToFit()
                .frame(height: Screen.dynamicHeight(widthRatio))
        }
    }
    // MARK: - Alignment Extensions
    struct Alignments {
        static let topLeft = Alignment.topLeading
        static let topCenter = Alignment.top
        static let topRight = Alignment.topTrailing
        static let centerLeft = Alignment.leading
        static let center = Alignment.center
        static let centerRight = Alignment.trailing
        static let bottomLeft = Alignment.bottomLeading
        static let bottomCenter = Alignment.bottom
        static let bottomRight = Alignment.bottomTrailing
        
    }
    
   
    }
     

