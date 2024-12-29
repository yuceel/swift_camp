
import UIKit

final class MenuButtonWireframe: BaseWireframe<LazyHostingViewController<MenuButtonView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<MenuButtonView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = MenuButtonPresenter(wireframe: self)
       moduleViewController.rootView = MenuButtonView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension MenuButtonWireframe: MenuButtonWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}


