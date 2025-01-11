import SwiftUI

class CustomShapeHostingController: UIHostingController<CustomShapeView> {
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: CustomShapeView())
    }

    init() {
        super.init(rootView: CustomShapeView())
    }
}
