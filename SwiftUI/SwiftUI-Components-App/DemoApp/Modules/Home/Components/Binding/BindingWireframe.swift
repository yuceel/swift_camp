
import UIKit

final class BindingWireframe: BaseWireframe<LazyHostingViewController<BindingView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<BindingView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = BindingPresenter(wireframe: self)
       moduleViewController.rootView = BindingView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension BindingWireframe: BindingWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}

