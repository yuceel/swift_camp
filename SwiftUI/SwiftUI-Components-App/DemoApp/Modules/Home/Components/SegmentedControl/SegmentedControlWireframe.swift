import UIKit

final class SegmentedControlWireframe: BaseWireframe<LazyHostingViewController<SegmentedControlView>>, SegmentedControlWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<SegmentedControlView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = SegmentedControlPresenter(wireframe: self)
        
        

        moduleViewController.rootView = SegmentedControlView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension SegmentedControlWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
