import UIKit

final class TextWireframe: BaseWireframe<LazyHostingViewController<TextView>> {
    
    // MARK: - Module setup
    init() {
        let moduleViewController = LazyHostingViewController<TextView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        
        let interactor = TextInteractor()
        let presenter = TextPresenter(wireframe: self, interactor: interactor)
        moduleViewController.rootView = TextView(presenter: presenter)
    }
}

// MARK: - Extensions
extension TextWireframe: TextWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
