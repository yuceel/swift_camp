final class TextFieldWireframe: BaseWireframe<LazyHostingViewController<TextFieldView>>, TextFieldWireframeInterface {
    
    init() {
        let moduleViewController = LazyHostingViewController<TextFieldView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        let presenter = TextFieldPresenter(wireframe: self)
        moduleViewController.rootView = TextFieldView(presenter: presenter)
    }
}

extension TextFieldWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
