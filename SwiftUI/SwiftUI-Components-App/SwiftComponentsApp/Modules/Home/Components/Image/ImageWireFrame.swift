
import UIKit

final class ImageWireframe: BaseWireframe<LazyHostingViewController<ImageView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<ImageView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = ImagePresenter(wireframe: self)
       moduleViewController.rootView = ImageView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension ImageWireframe: ImageWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}

