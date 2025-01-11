import UIKit

final class ZStackWireframe: BaseWireframe<LazyHostingViewController<ZStackView>> {
    
    // MARK: - Module setup -
    init() {
        let moduleViewController = LazyHostingViewController<ZStackView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = ZStackPresenter(wireframe: self)
        moduleViewController.rootView = ZStackView(presenter: presenter)
    }
}

// MARK: - Extensions -

extension ZStackWireframe: ZStackWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

