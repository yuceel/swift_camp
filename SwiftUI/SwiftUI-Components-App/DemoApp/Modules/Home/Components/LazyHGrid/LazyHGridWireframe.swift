
import UIKit

final class LazyHGridWireframe: BaseWireframe<LazyHostingViewController<LazyHGridView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<LazyHGridView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = LazyHGridPresenter(wireframe: self)
       moduleViewController.rootView = LazyHGridView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension LazyHGridWireframe: LazyHGridWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}

