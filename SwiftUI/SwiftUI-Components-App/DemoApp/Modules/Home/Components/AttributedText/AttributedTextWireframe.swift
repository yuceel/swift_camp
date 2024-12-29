import UIKit

final class AttributedTextWireframe: BaseWireframe<LazyHostingViewController<AttributedTextView>>, AttributedTextWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<AttributedTextView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = AttributedTextPresenter(wireframe: self)
        
        

        moduleViewController.rootView = AttributedTextView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension AttributedTextWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
