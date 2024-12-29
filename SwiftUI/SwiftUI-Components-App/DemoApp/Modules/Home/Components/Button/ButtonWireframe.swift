import UIKit

final class ButtonWireframe: BaseWireframe<LazyHostingViewController<ButtonView>>, ButtonWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<ButtonView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = ButtonPresenter(wireframe: self)
        
        

        moduleViewController.rootView = ButtonView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension ButtonWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
