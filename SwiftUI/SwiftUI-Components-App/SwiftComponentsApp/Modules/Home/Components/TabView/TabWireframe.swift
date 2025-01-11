import UIKit

final class TabWireframe: BaseWireframe<LazyHostingViewController<tabView>>, TabWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<tabView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = TabPresenter(wireframe: self)
        
        

        moduleViewController.rootView = tabView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension TabWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
