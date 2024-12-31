final class TransitionWireframe:BaseWireframe<LazyHostingViewController<TransitionView>> {
    
    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<TransitionView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = TransitionPresenter(wireframe: self)
        moduleViewController.rootView = TransitionView(presenter: presenter)
        }
}

// MARK: - Extensions -

extension TransitionWireframe:TransitionWireframeInterface{
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}