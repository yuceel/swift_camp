import UIKit

final class LongPressGestureWireframe: BaseWireframe<LazyHostingViewController<LongPressGestureView>>, LongPressGestureWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<LongPressGestureView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = LongPressGesturePresenter(wireframe: self)
        
        

        moduleViewController.rootView = LongPressGestureView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension LongPressGestureWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
