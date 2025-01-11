import UIKit

final class ShadowWireframe: BaseWireframe<LazyHostingViewController<ShadowView>>, ShadowWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<ShadowView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = ShadowPresenter(wireframe: self)
        
        

        moduleViewController.rootView = ShadowView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension ShadowWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
