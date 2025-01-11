
import UIKit

final class OpacityWireframe: BaseWireframe<LazyHostingViewController<OpacityView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<OpacityView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = OpacityPresenter(wireframe: self)
       moduleViewController.rootView = OpacityView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension OpacityWireframe: OpacityWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}

