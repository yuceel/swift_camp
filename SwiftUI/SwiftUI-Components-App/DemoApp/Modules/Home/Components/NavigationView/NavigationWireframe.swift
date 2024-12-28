import UIKit

final class NavigationWireframe: BaseWireframe<LazyHostingViewController<Navigationview>>, NavigationWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<Navigationview>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = NavigationPresenter(wireframe: self)
        
        

        moduleViewController.rootView = Navigationview(presenter: presenter)
    }

}

// MARK: - Extensions -

extension NavigationWireframe {

    func goBack() {
        navigationController?.popViewController(animated: true)
    }

}
