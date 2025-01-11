import UIKit

final class RoundedRectangleWireframe: BaseWireframe<LazyHostingViewController<RoundedRectangleView>>, RoundedRectangleWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<RoundedRectangleView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = RoundedRectanglePresenter(wireframe: self)
        
        

        moduleViewController.rootView = RoundedRectangleView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension RoundedRectangleWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
