import UIKit

final class AnimationWireframe: BaseWireframe<LazyHostingViewController<AnimationView>>, AnimationWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<AnimationView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = AnimationPresenter(wireframe: self)
        
        

        moduleViewController.rootView = AnimationView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension AnimationWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
