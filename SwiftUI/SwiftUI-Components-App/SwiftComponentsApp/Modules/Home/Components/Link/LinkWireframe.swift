import UIKit

final class LinkWireframe: BaseWireframe<LazyHostingViewController<LinkView>>, LinkWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<LinkView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = LinkPresenter(wireframe: self)
        moduleViewController.rootView = LinkView(presenter: presenter)
    }

    func goBack() {
        navigationController?.popViewController(animated: true)
    }

    func navigateToNewLink() {
        let newLinkViewController = UIViewController() // Yeni ekran için placeholder
        navigationController?.pushViewController(newLinkViewController, animated: true)
    }
}
