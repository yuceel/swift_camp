
import UIKit

final class HStackWireframe: BaseWireframe<LazyHostingViewController<HStackView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<HStackView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = HStackPresenter(wireframe: self)
       moduleViewController.rootView = HStackView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension HStackWireframe: HStackWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}

