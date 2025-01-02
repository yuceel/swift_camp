final class MagnificationGestureWireframe:BaseWireframe<LazyHostingViewController<MagnificationGestureView>> {
    
    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<MagnificationGestureView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = MagnificationGesturePresenter(wireframe: self)
        moduleViewController.rootView = MagnificationGestureView(presenter: presenter)
        }
}

// MARK: - Extensions -

extension MagnificationGestureWireframe:MagnificationGestureWireframeInterface{
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}