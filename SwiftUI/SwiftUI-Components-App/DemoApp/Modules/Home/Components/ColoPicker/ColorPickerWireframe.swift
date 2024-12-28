import UIKit

final class ColorPickerWireframe: BaseWireframe<LazyHostingViewController<ColorPickerView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<ColorPickerView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = ColorPickerPresenter(wireframe: self)
        moduleViewController.rootView = ColorPickerView(presenter: presenter)
    }
}

// MARK: - Extensions

extension ColorPickerWireframe: ColorPickerWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
