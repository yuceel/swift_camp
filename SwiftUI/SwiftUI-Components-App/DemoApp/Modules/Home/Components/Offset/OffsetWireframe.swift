import UIKit
import Foundation
import Combine


final class OffsetWireframe: BaseWireframe<LazyHostingViewController<OffsetView>>, OffsetWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<OffsetView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = OffsetPresenter(wireframe: self)

        moduleViewController.rootView = OffsetView(presenter: presenter)
    }
}

extension OffsetWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

