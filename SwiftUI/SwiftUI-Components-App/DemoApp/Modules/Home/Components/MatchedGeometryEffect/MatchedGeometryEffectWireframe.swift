import UIKit

final class MatchedGeometryEffectWireframe: BaseWireframe<LazyHostingViewController<MatchedGeometryEffectView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<MatchedGeometryEffectView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = MatchedGeometryEffectPresenter(wireframe: self)
        moduleViewController.rootView = MatchedGeometryEffectView(presenter: presenter)
    }
}

// MARK: - Extensions

extension MatchedGeometryEffectWireframe: MatchedGeometryEffectWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
