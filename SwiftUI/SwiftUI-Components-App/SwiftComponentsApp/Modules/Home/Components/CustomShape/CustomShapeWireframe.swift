import UIKit
import SwiftUI

class CustomShapeWireframe: BaseWireframe<CustomShapeHostingController> {
    init() {
        let hostingController = CustomShapeHostingController()
        let presenter = CustomShapePresenter(view: hostingController.rootView)
        hostingController.rootView.presenter = presenter
        super.init(viewController: hostingController)
    }

    static func createModule() -> CustomShapeWireframe {
        return CustomShapeWireframe()
    }
}
