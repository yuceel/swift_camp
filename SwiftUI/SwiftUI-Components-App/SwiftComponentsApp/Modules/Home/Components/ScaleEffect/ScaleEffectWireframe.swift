import UIKit

final class ScaleEffectWireframe: BaseWireframe<LazyHostingViewController<ScaleEffectView>>, ScaleEffectWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<ScaleEffectView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = ScaleEffectPresenter(wireframe: self)
        
        

        moduleViewController.rootView = ScaleEffectView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension ScaleEffectWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
