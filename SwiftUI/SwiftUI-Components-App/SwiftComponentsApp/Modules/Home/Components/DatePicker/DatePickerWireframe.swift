import UIKit

final class DatePickerWireframe: BaseWireframe<LazyHostingViewController<DatePickerView>>, DatePickerWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<DatePickerView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = DatePickerPresenter(wireframe: self)
        
        

        moduleViewController.rootView = DatePickerView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension DatePickerWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
