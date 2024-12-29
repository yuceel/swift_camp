
final class AlertWireframe:BaseWireframe<LazyHostingViewController<AlertView>>, AlertWireframeInterface {
    
    
    init() {
        let moduleViewController = LazyHostingViewController<AlertView>(isNavigationBarHidden: true)
        
        super.init(viewController: moduleViewController)
        
        let presenter = AlertPresenter(wireframe: self)
        moduleViewController.rootView = AlertView(presenter: presenter)
    }
}

extension AlertWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}








/**
 
 
 
 
 final class LazyHStackWireframe: BaseWireframe<LazyHostingViewController<LazyHStackView>>, LazyHStackWireframeInterface {
     
     // MARK: - Module setup -

     init() {
         let moduleViewController = LazyHostingViewController<LazyHStackView>(isNavigationBarHidden: true)

         super.init(viewController: moduleViewController)

         let presenter = LazyHStackPresenter(wireframe: self)

         moduleViewController.rootView = LazyHStackView(presenter: presenter)
     }
 }

 extension LazyHStackWireframe {
     func goBack() {
         navigationController?.popViewController(animated: true)
     }
 }


 */
