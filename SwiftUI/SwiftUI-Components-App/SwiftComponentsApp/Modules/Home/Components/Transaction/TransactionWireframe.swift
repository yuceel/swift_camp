import UIKit

final class TransactionWireframe: BaseWireframe<LazyHostingViewController<TransactionView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<TransactionView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = TransactionPresenter(wireframe: self)
        moduleViewController.rootView = TransactionView(presenter: presenter)
    }
}

// MARK: - Extensions

extension TransactionWireframe: TransactionWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
