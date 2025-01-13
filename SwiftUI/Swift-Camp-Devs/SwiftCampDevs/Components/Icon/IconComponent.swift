import SwiftUI

// Generic Icon View
struct SCIcon: View {
    let iconName: String
    let size: IconSize
    let color: Color // Restricted to black or white
    var body: some View {
        Image(systemName: iconName)
            .resizable()
            .scaledToFit()
            .frame(width: size.size, height: size.size)
            .foregroundColor(color)
    }
}

 #Preview {
     Text("Large Icon")
     SCIcon(iconName: "star.fill", size: .large, color: AppColors.black)
     Text("Medium Icon")
     SCIcon(iconName: "star.fill", size: .medium, color: AppColors.black)
     Text("Small Icon")
     SCIcon(iconName: "star.fill", size: .small, color: AppColors.black)
}
